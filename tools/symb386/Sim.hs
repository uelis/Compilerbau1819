{-# LANGUAGE UndecidableInstances, ScopedTypeVariables, BangPatterns, UnboxedTuples #-}

{- Intel simulator

   Organization of memory:

   - the memory layout remains abstract, access via symbolic addresses

   - an address is a heap, a stack address or a code address

   Organization of heap :

     - finite map from symbolic adresses to arrays

     - an address is a symbolic base plus an offset

     - computing an address which points outside of the array raises an
       exception

   Organization of the stack:

     - stack layout

         ebp[+4(n+2)]  arg_n
         ...           ...
         ebp[+12]      arg_1
         ebp[+8]       arg_0 (usually this)
         ebp[+4]       ret addr
         ebp[+0]       saved ebp
         ebp[-4]       param_0
         ...           ...
         ebp[-4(n+1)]  param_n

     - strict stack checking: errors are

       - reading from uninitialized cell

       - reading/writing above stack top

       - reading/writing below esp (stack bottom)

   Organization of registers:

     - mutable register file, including map for temps

 -}

module Sim(run) where

import Prelude hiding (not, read)
import qualified Prelude as Prelude

import System.IO
import Control.Monad.Except
import Control.Monad.Reader

import Data.Bits
import Data.Char
import Data.Int
import Data.Word
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import Data.Array.IO
import qualified Data.HashTable.IO as H
import Data.IORef

import Names
import Intel

type HashTable k v = H.BasicHashTable k v

----------------------------------------------------------------------
-- Values
----------------------------------------------------------------------

-- The heap is partitioned into disjoint blocks that are addressed by
-- BlockAddr values.
type BlockAddr = Word16

data Tag = Undef | SignedInt | CodeAddr | StackAddr | HeapAddr !BlockAddr
  deriving Eq

data Val = Val { tag :: !Tag, val :: !Int32 }

instance Show Val where
  show (Val Undef _) = "unknown"
  show (Val SignedInt x) = show x ++ ":int"
  show (Val CodeAddr x) = show x ++ ":(code address)"
  show (Val StackAddr x) = show x ++ ":(stack address)"
  show (Val (HeapAddr block) x) = show x ++ ":(heap address in block " ++ show block ++ ")"

isUndef :: Val -> Bool
isUndef !v = tag v == Undef

isCodeAddr :: Val -> Bool
isCodeAddr !v = tag v == CodeAddr

isStackAddr :: Val -> Bool
isStackAddr !v = tag v == StackAddr

isAligned :: Int32 -> Bool
isAligned !a = a .&. 3 == 0

-- value arithmetic

plus_imm :: Val -> Int32 -> Val
plus_imm x i =  Val { tag = tag x, val = val x + i }

plus :: Monad m => Val -> Val -> m Val
plus x (Val SignedInt i) = return $ plus_imm x i
plus (Val SignedInt i) y = return $ plus_imm y i
plus x y = fail $ "cannot add " ++ show x ++ " and " ++ show y

minus_imm :: Val -> Int32 -> Val
minus_imm x i =  Val { tag = tag x, val = val x - i }

minus :: Monad m => Val -> Val -> m Val
minus x (Val SignedInt i) = return $ minus_imm x i
minus x y = fail $ "cannot subtract " ++ show y ++ " from " ++ show x

-- this should be 32bit unsigned multiplication (for address scaling)
-- but not yet implemented
times :: Monad m => Val -> Val -> m Val
times (Val SignedInt x) (Val SignedInt y) = return $ Val SignedInt $ x * y
times x (Val SignedInt 1) = return $ x
times (Val SignedInt 1) x = return $ x
times x y = fail $ "cannot multiply " ++ show x ++ " and " ++ show y

sal :: Monad m => Val -> Val -> m Val
sal (Val SignedInt x) (Val SignedInt y) =
  return $ Val SignedInt $ x `shiftL` (fromIntegral y)
sal x y = fail $ "cannot shift left " ++ show x ++ " by " ++ show y

sar :: Monad m => Val -> Val -> m Val
sar (Val SignedInt x) (Val SignedInt y) =
  return $ Val SignedInt $ x `shiftR` (fromIntegral y)
sar x y = fail $ "cannot shift right " ++ show x ++ " by " ++ show y

shr :: Monad m => Val -> Val -> m Val
shr (Val SignedInt x) (Val SignedInt y) =
  return $ Val SignedInt $ fromIntegral $ (fromIntegral x :: Word32) `shiftR` (fromIntegral y)
shr x y = fail $ "cannot shift right " ++ show x ++ " by " ++ show y

land :: Monad m => Val -> Val -> m Val
land (Val SignedInt x) (Val SignedInt y) = return $ Val SignedInt $ x .&. y
land x y = fail $ "cannot perform logical and " ++ show x ++ " by " ++ show y

lor :: Monad m => Val -> Val -> m Val
lor (Val SignedInt x) (Val SignedInt y) = return $ Val SignedInt $ x .|. y
lor x y = fail $ "cannot perform logical or " ++ show x ++ " by " ++ show y

lxor :: Monad m => Val -> Val -> m Val
lxor (Val SignedInt x) (Val SignedInt y) = return $ Val SignedInt $ x `xor` y
lxor x y = fail $ "cannot perform logical xor " ++ show x ++ " by " ++ show y

neg :: Monad m => Val -> m Val
neg (Val SignedInt x) = return $ Val SignedInt $ -x
neg x = fail $ "cannot negate " ++ show x

not :: Monad m => Val -> m Val
not (Val SignedInt x) = return $ Val SignedInt $ complement x
not x = fail $ "cannot logically negate " ++ show x

inc :: Monad m => Val -> m Val
inc x = return $ plus_imm x 1

dec :: Monad m => Val -> m Val
dec x = return $ minus_imm x 1

cmp :: Monad m => Val -> Val -> m Ordering
cmp (Val SignedInt x) (Val SignedInt y) = return $ compare x y
cmp x y = fail $ "cannot compare " ++ show x ++ " with " ++ show y

splitQ :: Int64 -> (# Int32, Int32 #)
splitQ !q = (# fromIntegral $ q `shiftR` 32
            , fromIntegral $ q .&. 0xFFFFFFFF
            #)

joinQ :: Int32 -> Int32 -> Int64
joinQ !h !l = fromIntegral ((h1 `shiftL` 32) .|. l1)
   where h1 = (fromIntegral (fromIntegral h :: Word32)) :: Word64
         l1 = (fromIntegral (fromIntegral l :: Word32)) :: Word64

-- convert double word into quadword
cdq :: Monad m => Val -> m (Val, Val)
cdq (Val SignedInt x) = return $ (Val SignedInt x1, Val SignedInt x2)
  where (# x1, x2 #) = splitQ (fromIntegral x :: Int64)
cdq x = fail $ "cannot convert signed " ++ show x ++ " from 32bit to 64bit"

imul :: Monad m => Val -> Val -> m (Val, Val)
imul (Val SignedInt x) (Val SignedInt y) = do
  let r :: Int64 = (fromIntegral x :: Int64) * (fromIntegral y :: Int64)
  let (# h, l #) = splitQ r
  return (Val SignedInt h, Val SignedInt l)
imul x y = fail $ "cannot multiply " ++ show x ++ " and " ++ show y

idiv :: Monad m => (Val, Val) -> Val -> m Val
idiv (Val SignedInt h, Val SignedInt l) (Val SignedInt y) | y /= 0 =
  return $ Val SignedInt $ fromIntegral $ joinQ h l `quot` fromIntegral y
idiv x y = fail $ "cannot divide " ++ show x ++ " by " ++ show y

----------------------------------------------------------------------
-- Memory strips
----------------------------------------------------------------------

-- | Maps displacements (multiples of wordSize) to values.
type Mem = IOArray Int32 Val

checkAlignment :: (Monad m) => Int32 -> m ()
checkAlignment !a | isAligned a = return ()
                  | otherwise = fail "address not 32bit aligned"

-- | Warning: does not check range of address, should be done before.
readMem :: (MonadIO m) => Int32 -> Mem -> m Val
readMem !a !m = do
  checkAlignment a
  liftIO $ readArray m (a `shiftR` 2)

-- | Warning: does not check range of address, should be done before.
writeMem :: (MonadIO m) => Int32 -> Val -> Mem -> m ()
writeMem !a !v !m = do
  checkAlignment a
  liftIO $ writeArray m (a `shiftR` 2) (v)

----------------------------------------------------------------------
-- Heap
----------------------------------------------------------------------

data Block = Block { size :: !Int32          -- size: # bytes
                   , mem  :: !Mem
                   }

newBlock :: (MonadIO m) => Int32 -> m Block
newBlock !sz = do
  hs <- liftIO $ newArray (0, fromIntegral (sz `shiftR` 2)) ((Val SignedInt 0))
  return $ Block sz hs

checkBlockBounds :: (MonadIO m) => Int32 -> Block -> m ()
checkBlockBounds !i !b = do
  when (i < 0 || i >= size b) $ fail $ "attempted access beyond allocated memory"

readBlock :: (MonadIO m) => Int32 -> Block -> m Val
readBlock !d !b = do
  checkBlockBounds d b
  readMem d (mem b)

writeBlock :: (MonadIO m) => Int32 -> Val -> Block -> m ()
writeBlock !d !v !b = do
  checkBlockBounds d b
  writeMem d v (mem b)

type FreeList = [BlockAddr]

data Heap = Heap { hmap :: !(HashTable BlockAddr Block)
                 , free :: !(IORef FreeList)
                 }

emptyHeap :: (MonadIO m) => m Heap
emptyHeap = do
  hm <- liftIO $ H.new
  fr <- liftIO $ newIORef [ 0 .. maxBound ]
  return $ Heap { hmap = hm, free = fr }

readHeap :: (MonadIO m) => BlockAddr -> Int32 -> Heap -> m Val
readHeap !base !disp !h = do
    x <- liftIO $ H.lookup (hmap h) base
    case x of   -- get block
      Nothing -> fail $ "readHeap: not a valid block id " ++ show base
      Just block -> readBlock disp block

writeHeap :: (MonadIO m) => BlockAddr -> Int32 -> Val -> Heap -> m ()
writeHeap !base !disp !v !h = do
    x <- liftIO $ H.lookup (hmap h) base
    case x of
      Nothing -> fail $ "when trying to write to memory: invalid address "
                  ++ show (Val (HeapAddr base) disp)
      Just block -> writeBlock disp v block

allocBlockHeap :: (MonadIO m) => Int32 -> Heap -> m Val
allocBlockHeap !sz !h = do
  block <- newBlock sz
  fr <- liftIO $ readIORef (free h)
  case fr of
    [] -> error "impossible: heapAlloc: out of heap space"
    x:xs -> do
      liftIO $ H.insert (hmap h) x block
      liftIO $ writeIORef (free h) xs
      return $ Val (HeapAddr x) 0


----------------------------------------------------------------------
-- Stack
----------------------------------------------------------------------

type Stack = IOArray Int32 Val

stackTop :: Int32
stackTop = 1024 * 1024

newStack :: (MonadIO m) => m Stack
newStack = liftIO $ newArray (0, stackTop `shiftR` 2) (Val Undef 0)

checkStackBounds :: (MonadIO m) => Int32 -> Int32 -> m ()
checkStackBounds !esp !a | (a > stackTop || a < esp) =
  fail $ "invalid stack address " ++ show a
  ++ "; valid range is " ++ show esp ++ " to " ++ show stackTop
checkStackBounds _ _ = return ()

readStack :: (MonadIO m) => Int32 -> Int32 -> Stack -> m Val
readStack !esp !a !m = do
  checkAlignment a
  checkStackBounds esp a
  v <- liftIO $ readArray m (a `shiftR` 2)
  when (isUndef v) $ fail "read of possibly uninitialised value from stack"
  return v

writeStack :: (MonadIO m) => Int32 -> Int32 -> Val -> Stack -> m ()
writeStack !esp !a !v !m = do
  checkAlignment a
  checkStackBounds esp a
  liftIO $ writeArray m (a `shiftR` 2) (v)

----------------------------------------------------------------------
-- Register file
----------------------------------------------------------------------

type TempFile = Map Temp  Val  --optimize: IntMap
type Regs     = IOArray Int Val

data RegFile = RegFile { regs  :: !Regs
                       , temps :: !(IORef TempFile)
                       }

newRegFile :: (MonadIO m) => m RegFile
newRegFile = do
  regs <- liftIO $ newListArray (0, 7) [ (Val SignedInt 0)
                                       , (Val SignedInt 0)
                                       , (Val SignedInt 0)
                                       , (Val SignedInt 0)
                                       , (Val SignedInt 0)
                                       , (Val SignedInt 0)
                                       , (Val StackAddr stackTop)
                                       , (Val StackAddr stackTop)
                                       ]
  temps <- liftIO $ newIORef Map.empty
  return $ RegFile regs temps

readReg :: (MonadIO m) => Reg -> RegFile -> m Val
readReg (Fixed r@(Reg32 ri)) !rf = do
  v <-  liftIO $ readArray (regs rf) ri
--  when (isUndef v) $
--      fail ("register " ++ show r
--      ++ " is dirty, cannot be assumed to have defined value at this point.\n"
--      ++ "Possible reasons: read from uninitialised memory or "
--      ++ "non-observance of calling convention.")
  return v
readReg (Flex t) !rf = do
  ts <- liftIO $ readIORef (temps rf)
  case Map.lookup t ts of
     Just x -> return x
     Nothing -> fail ("unknown temporary '" ++ show t ++ "'")

-- can only write stack addresses to bp, sp
writeReg :: (MonadIO m) => Reg -> Val -> RegFile -> m ()
writeReg !dest !v !rf =
  case dest of
    Fixed (Reg32 n) | isStackReg n, Prelude.not (isStackAddr v) ->
      fail "write of non-stack address to stack register"
    Fixed (Reg32 r) -> do
      liftIO $ writeArray (regs rf) r (v)
    Flex  t -> do
      ts <- liftIO $ readIORef (temps rf)
      liftIO $ writeIORef (temps rf) (Map.insert t v ts)
  where isStackReg n = n == ebp || n == esp


----------------------------------------------------------------------
-- Flags
----------------------------------------------------------------------

type Flags = Ordering -- imperfect implementation for now

trueCond :: Cond -> Flags -> Bool
trueCond Intel.E  EQ = True
trueCond Intel.NE LT = True
trueCond Intel.NE GT = True
trueCond Intel.L  LT = True
trueCond Intel.LE LT = True
trueCond Intel.LE EQ = True
trueCond Intel.G  GT = True
trueCond Intel.GE EQ = True
trueCond Intel.GE GT = True
trueCond _ _ = False

----------------------------------------------------------------------
-- State of the Simulator
----------------------------------------------------------------------

data St = St { regfile :: !RegFile
             , eflags :: !(IORef Flags)
             , stack :: !Stack
             , heap :: !Heap
             , rfStack :: !(IORef [TempFile])
             }

initSt :: IO St
initSt = do
  rf0 <- newRegFile
  eflags0 <- newIORef EQ
  stack0 <- newStack
  heap0 <- emptyHeap
  rf0 <- newRegFile
  rfStack0 <- newIORef []
  return $ St rf0 eflags0 stack0 heap0 rfStack0

----------------------------------------------------------------------
-- Memory State       (all forms of memory : register, heap, stack) --
----------------------------------------------------------------------

getReg  :: (MonadIO m, MonadReader St m) => Reg -> m Val
getReg !r = readReg r =<< asks regfile

setReg  :: (MonadIO m, MonadReader St m) => Reg -> Val -> m ()
setReg !r !v = writeReg r v =<< asks regfile

polluteReg :: (MonadIO m, MonadReader St m) => Reg -> m ()
polluteReg !r = setReg r $ Val Undef 0

polluteCallerSave :: (MonadIO m, MonadReader St m) => m ()
polluteCallerSave = mapM_ polluteReg callerSave

-- reading/writing flags

getFlags :: (MonadIO m, MonadReader St m) => m Flags
getFlags = do
  st <- ask
  liftIO $ readIORef (eflags st)

setFlags :: (MonadIO m, MonadReader St m) =>  Flags -> m ()
setFlags !f = do
  st <- ask
  liftIO $ writeIORef (eflags st) f

  -- reading from memory
readAddr :: (MonadIO m, MonadReader St m) => Val -> m Val
readAddr (Val (HeapAddr !base) !disp) = do
  st <- ask
  readHeap base disp (heap st)
readAddr (Val StackAddr !a) = do
  st <- ask
  sp <- getReg esp
  readStack (val sp) a (stack st)
readAddr a =
  fail $ "memory lookup failure: " ++ show a ++ " is not an address"

  -- writing to memory

writeAddr :: (MonadIO m, MonadReader St m) => Val -> Val -> m ()
writeAddr (Val (HeapAddr !base) !disp) !v = do
  st <- ask
  writeHeap base disp v (heap st)
writeAddr (Val StackAddr !a) !v = do
  st <- ask
  sp <- getReg esp
  writeStack (val sp) a v (stack st)
writeAddr a _ =
  fail $ "memory write failure: " ++ show a ++ " is not an address"

getArgBeforeCall :: (MonadIO m, MonadReader St m) => Int -> m Val
getArgBeforeCall n = do
  sp <- getReg esp
  readAddr (plus_imm sp (fromIntegral $ n * wordSize))

  -- pushing/popping register file
saveRegs :: (MonadIO m, MonadReader St m) => m ()
saveRegs = do
  st <- ask
  ts <- liftIO $ readIORef (temps $ regfile st)
  liftIO $ modifyIORef' (rfStack st) (ts:)

  -- restore register file except stack registers bp, sp
restoreRegs :: (MonadIO m, MonadReader St m) =>  m ()
restoreRegs = do
  st <- ask
  tempstack <- liftIO $ readIORef (rfStack st)
  when (null tempstack) $
    fail "restore failed: register file stack empty"
  let (tf : tfs) = tempstack
  liftIO $ writeIORef (temps $ regfile st) tf
  liftIO $ writeIORef (rfStack st) tfs

-- evaluating expressions (registers or effectively addressed cells)

class Eval m a where
  eval :: a -> m Val

instance Monad m => Eval m Scale where
  eval S1 = return $ Val SignedInt 1
  eval S2 = return $ Val SignedInt 2
  eval S4 = return $ Val SignedInt 4
  eval S8 = return $ Val SignedInt 8

instance (MonadIO m, MonadReader St m) => Eval m EA where
  eval (EA !i Nothing Nothing !d) = do
    idx <- getReg i
    pure $ plus_imm idx d
  eval (EA !i (Just !s) Nothing !d) = do
    idx <- getReg i
    scale <- eval s
    p <- times idx scale
    return $ plus_imm p d
  eval (EA !i Nothing (Just !r) !d) = do
    bse <- getReg r
    idx <- getReg i
    p <- plus bse idx
    return $ plus_imm p d
  eval (EA !i (Just !s) (Just !r) !d) = do
    bse <- getReg r
    idx <- getReg i
    scale <- eval s
    p <- times idx scale
    plus bse =<< (pure (plus_imm p d))

instance (MonadIO m, MonadReader St m) => Eval m Dest where
  eval (Reg r) = getReg r
  eval (Mem ea) = do
    addr  <- eval ea
    readAddr addr

instance (MonadIO m, MonadReader St m) => Eval m Src where
  eval (Imm i) = return $ Val SignedInt i
  eval (Dest d) = eval d

----------------------------------------------------------------------
-- Runtime environment
----------------------------------------------------------------------

print_char :: (MonadIO m, MonadReader St m) => Val -> m ()
print_char (Val SignedInt x) = liftIO $ putStr [chr . fromIntegral . toInteger $ x]
print_char x = fail $ "cannot print " ++ show x

print_int :: (MonadIO m, MonadReader St m) => Val -> m ()
print_int (Val SignedInt x) = liftIO $ putStr (show x ++ "\n")
print_int x = fail $ "cannot print " ++ show x

read :: (MonadIO m) => m Val
read = do
  c <- liftIO getChar
  return $ Val SignedInt $ fromIntegral $ ord c

allocBlock :: (MonadIO m, MonadReader St m) => Val -> m Val
allocBlock (Val SignedInt x) = do
  st <- ask
  allocBlockHeap (fromIntegral x) (heap st)
allocBlock x = fail $ "cannot allocate object of size " ++ show x

----------------------------------------------------------------------
-- Simulator
----------------------------------------------------------------------

type Prg = IOArray Int32 Instr

getInstr :: (MonadIO m, MonadReader St m) => Int32 -> Prg -> m Instr
getInstr !i !prg = liftIO $ readArray prg i

writeDest :: (MonadIO m, MonadReader St m) => Dest -> Val -> m ()
writeDest (Reg !r) !v = setReg r v
writeDest (Mem !ea) !v = do
  addr <- eval ea
  writeAddr addr v

push :: (MonadIO m, MonadReader St m) => Val -> m ()
push !v = do
  sp <- getReg esp  -- by inv: must be stack address
  sp' <- pure $ minus_imm sp (fromIntegral wordSize)
  setReg esp sp'
  writeAddr sp' v

pop :: (MonadIO m, MonadReader St m) => m Val
pop = do
  sp <- getReg esp  -- by inv: must be stack address
  v <- readAddr sp
  setReg esp $ plus_imm sp (fromIntegral wordSize)
  return v

exec :: (MonadIO m, MonadReader St m) => Bool -> Prg -> Int32 -> m ()
exec !verbose !prg !pc0 = do
  -- put -1 as exit return address on stack
  push (Val CodeAddr (-1))
  saveRegs
  -- execute until code jumps to -1
  execLoop pc0
  where
    execLoop :: (MonadIO m, MonadReader St m) => Int32 -> m ()
    execLoop !pc | pc == -1 = return ()
    execLoop !pc = do
      i <- getInstr pc prg
      when verbose $ do
          liftIO $ hPutStrLn stderr $ "executing " ++ (show i)
      pc' <- exec' i pc
      when (verbose && canModifyRegs i) $ do
          let registers = [eax, ebx, ecx, edx, esi, edi, ebp, esp]
          let names = ["eax", "ebx", "ecx", "edx", "esi", "edi", "ebp", "esp"]
          values <- map (('=':).show) <$> mapM getReg registers
          let results = zipWith (++) names values
          liftIO $ hPutStrLn stderr $ take 26 (repeat ' ') ++ "==> " ++ unwords results
      execLoop pc'
      where canModifyRegs :: Instr -> Bool
            canModifyRegs (LABEL _) = False
            canModifyRegs (JMP _) = False
            canModifyRegs (J _ _) = False
            canModifyRegs _ = True

    exec' :: (MonadIO m, MonadReader St m) => Instr -> Int32 -> m Int32
    exec' (LABEL _) pc =
      return $ pc + 1
    exec' (CALL BuiltinRaise) pc = do
      v <- getArgBeforeCall 0
      fail $ "exception " ++ show v ++ " raised"
    exec' (CALL BuiltinPrintln) pc = do
      v <- getArgBeforeCall 0
      print_int v
      polluteCallerSave
      setReg eax (Val SignedInt 0)
      return $ pc + 1
    exec' (CALL BuiltinWrite) pc = do
      v <- getArgBeforeCall 0
      print_char v
      polluteCallerSave
      setReg eax (Val SignedInt 0)
      return $ pc + 1
    exec' (CALL BuiltinRead) pc = do
      v <- read
      polluteCallerSave
      setReg eax v
      return $ pc + 1
    exec' (CALL BuiltinHalloc) pc = do
      v <- getArgBeforeCall 0
      a <- allocBlock v
      polluteCallerSave
      setReg eax a
      return $ pc + 1
    exec' (CALL (Index i)) pc = do
      saveRegs
      push (Val CodeAddr (pc + 1))  -- push return address
      return i
    exec' (RET) pc = do --traceReturn $ do
      retaddr <- pop -- pop return address
      when (Prelude.not (isCodeAddr retaddr)) $
        fail "stack does not contain return address"
      restoreRegs  -- and return
      setReg ecx (Val Undef 0)  -- pollute callee saves except the return reg
      setReg edx (Val Undef 0)
      return $ val retaddr
    exec' (JMP (Index i)) pc = do
      return i
    exec' (J c (Index i)) pc = do
      flags <- getFlags
      if trueCond c flags then return i else return $ pc + 1
    exec' (DS MOV d s) pc = do
      eval s >>= writeDest d
      return $ pc + 1
    exec' (DS ADD d s) pc = do
      x <- eval d
      y <- eval s
      plus x y >>= writeDest d
      return $ pc + 1
    exec' (DS SUB d s) pc = do
      x <- eval d
      y <- eval s
      minus x y >>= writeDest d
      return $ pc + 1
    exec' (DS IMUL2 d s) pc = do
      x <- eval d
      y <- eval s
      times x y >>= writeDest d
      return $ pc + 1
    exec' (DS AND d s) pc = do
      x <- eval d
      y <- eval s
      land x y >>= writeDest d
      return $ pc + 1
    exec' (DS OR  d s) pc = do
      x <- eval d
      y <- eval s
      lor x y >>= writeDest d
      return $ pc + 1
    exec' (DS XOR d (Dest d')) pc | d == d' = do
      writeDest d (Val SignedInt 0)
      return $ pc + 1
    exec' (DS XOR d s) pc = do
      x <- eval d
      y <- eval s
      lxor x y >>= writeDest d
      return $ pc + 1
    exec' (DS SHL d s) pc = do
      x <- eval d
      y <- eval s
      sal x y >>= writeDest d
      return $ pc + 1
    exec' (DS SHR d s) pc = do
      x <- eval d
      y <- eval s
      shr x y >>= writeDest d
      return $ pc + 1
    exec' (DS SAL d s) pc = do
      x <- eval d
      y <- eval s
      sal x y >>= writeDest d
      return $ pc + 1
    exec' (DS SAR d s) pc = do
      x <- eval d
      y <- eval s
      sar x y >>= writeDest d
      return $ pc + 1
    exec' (LEA r ea) pc = do
      x <- eval ea
      setReg r x
      return $ pc + 1
    exec' (CMP d s) pc = do
      x <- eval d
      y <- eval s
      r <- cmp x y
      setFlags r
      return $ pc + 1
    exec' (PUSH s) pc = do
      eval s >>= push
      return $ pc + 1
    exec' (D POP d) pc = do
      pop >>= writeDest d
      return $ pc + 1
    exec' (D NEG d) pc = do
      eval d >>= neg >>= writeDest d
      return $ pc + 1
    exec' (D NOT d) pc = do
      eval d >>= not >>= writeDest d
      return $ pc + 1
    exec' (D INC d) pc = do
      eval d >>= inc >>= writeDest d
      return $ pc + 1
    exec' (D DEC d) pc = do
      eval d >>= dec >>= writeDest d
      return $ pc + 1
    exec' (IMUL s) pc = do
      x <- eval s
      y <- getReg eax
      (dx,ax) <- imul x y
      setReg eax ax
      setReg edx dx
      -- also OF and CF need to be cleared if result is 32bit
      return $ pc + 1
    exec' (IDIV s) pc = do
      h <- getReg edx
      l <- getReg eax
      y <- eval s
      z <- (h, l) `idiv` y
      setReg eax z
      polluteReg edx -- remainder sits in edx, we do not simulate this
      return $ pc + 1
    exec' CDQ pc = do
      x <- getReg eax
      (h, l) <- cdq x
      setReg edx h
      setReg eax l
      return $ pc + 1
    exec' (ENTER n) pc = do
      push =<< getReg ebp
      setReg ebp =<< getReg esp
      v <- getReg esp
      setReg esp (minus_imm v n)
      return $ pc + 1
    exec' LEAVE pc = do
      setReg esp =<< getReg ebp
      setReg ebp =<< pop
      return $ pc + 1
    exec' NOP pc =
      return $ pc + 1
    exec' (CALL (Symbolic l)) _ = fail $ "call of undefined function" ++ l
    exec' (JMP (Symbolic l)) _ = fail $ "jump to undefined label " ++ l
    exec' (JMP l@BuiltinPrintln) _ = fail $ "jump to built-in funtion " ++ (show l)
    exec' (JMP l@BuiltinWrite) _ = fail $ "jump to built-in funtion " ++ (show l)
    exec' (JMP l@BuiltinRead) _ = fail $ "jump to built-in funtion " ++ (show l)
    exec' (JMP l@BuiltinRaise) _ = fail $ "jump to built-in funtion " ++ (show l)
    exec' (JMP l@BuiltinHalloc) _ = fail $ "jump to built-in funtion " ++ (show l)
    exec' (J _ (Symbolic l)) _ = fail $ "jump to undefined label " ++ l
    exec' (J _ l@BuiltinPrintln) _ = fail $ "jump to built-in funtion " ++ (show l)
    exec' (J _ l@BuiltinWrite) _ = fail $ "jump to built-in funtion " ++ (show l)
    exec' (J _ l@BuiltinRead) _ = fail $ "jump to built-in funtion " ++ (show l)
    exec' (J _ l@BuiltinRaise) _ = fail $ "jump to built-in funtion " ++ (show l)
    exec' (J _ l@BuiltinHalloc) _ = fail $ "jump to built-in funtion " ++ (show l)

newtype Sim a = Sim { unSim :: (ReaderT St IO) a }
  deriving (Functor, Applicative, Monad, MonadReader St, MonadIO)

run :: Bool -> [Instr] -> IO ()
run verbose is = do
  hSetEncoding stdin char8 -- make sure that read reads bytes
  let labelMap = labels is
      is' = map (labelsToAddr labelMap) is
  lmain <- case Map.lookup "Lmain" labelMap of
             Nothing -> fail "Label 'Lmain' not defined"
             Just l -> return $ fromIntegral l
  prg <- newListArray (0, fromIntegral $ length is') is'
  s0 <- initSt
  exec verbose prg lmain `runReaderT` s0
