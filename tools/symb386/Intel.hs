
-- Intel Machine Instructions 386 32bit

module Intel where

import Prelude hiding ((<>))
import Data.Char -- toLower
import Data.Int
import Data.Map (Map)
import qualified Data.Map as Map
import Text.PrettyPrint

import Names
import Pretty

wordSize :: Int
wordSize = 4

class Register a where
  eax :: a
  ebx :: a
  ecx :: a
  edx :: a
  esi :: a
  edi :: a
  ebp :: a
  esp :: a

instance Register Int where
  eax = 0  -- accumulator for MUL and DIV
  ebx = 1
  ecx = 2
  edx = 3  -- holds upper half of MUL/DIV result
  esi = 4
  edi = 5
  ebp = 6  -- frame pointer
  esp = 7  -- stack pointer

newtype Reg32 = Reg32 Int
    deriving (Eq, Ord)

regNames :: [String]    
regNames =  ["eax", "ebx", "ecx", "edx", "esi", "edi", "ebp", "esp"]

instance Show Reg32 where
  show (Reg32 r) = regNames !! (fromIntegral r)

instance Register Reg32 where
  eax = Reg32 eax
  ebx = Reg32 ebx
  ecx = Reg32 ecx
  edx = Reg32 edx
  esi = Reg32 esi
  edi = Reg32 edi
  ebp = Reg32 ebp
  esp = Reg32 esp

-- Intel specific implementation

callerSave :: Register a => [a]
callerSave = [ eax , ecx , edx ]

calleeSave :: Register a => [a]
calleeSave = [ ebx , esi , edi ]

-- temporaries

data Reg = Fixed { unFixed :: Reg32 } -- fixed register, cannot be changed
         | Flex  { unFlex  :: Temp  } -- a register to be assigned later
           deriving (Eq, Ord)

instance Show Reg where
  show (Fixed r) = show r
  show (Flex t)  = show t

instance Temporary Reg where
  temp = Flex

instance Register Reg where
  eax = Fixed eax
  ebx = Fixed ebx
  ecx = Fixed ecx
  edx = Fixed edx
  esi = Fixed esi
  edi = Fixed edi
  ebp = Fixed ebp
  esp = Fixed esp

data Scale = S1 | S2 | S4 | S8 -- possible scaling values for effective addressing
           deriving (Eq)

-- parts of e.a.

data EA = EA !Reg !(Maybe Scale) !(Maybe Reg) !Int32
  deriving Eq
--         index * scale      + base     + Displacement

data Dest = Reg Reg
          | Mem EA
            deriving (Eq)

instance Temporary Dest where
  temp = Reg . temp

instance Register Dest where
  eax = Reg eax
  ebx = Reg ebx
  ecx = Reg ecx
  edx = Reg edx
  esi = Reg esi
  edi = Reg edi
  ebp = Reg ebp
  esp = Reg esp

data Src = Imm Int32      -- immediate value
         | Dest Dest      -- or register or eff.addr.
           deriving (Eq)

type Src' = Dest   -- src which cannot be immed.

instance Temporary Src where
  temp = Dest . temp

instance Register Src where
  eax = Dest eax
  ebx = Dest ebx
  ecx = Dest ecx
  edx = Dest edx
  esi = Dest esi
  edi = Dest edi
  ebp = Dest ebp
  esp = Dest esp

data Cond = E | NE | L | LE | G | GE
               deriving (Eq, Show)

-- destructive instruction with dest. and source
data DS = MOV      -- dest := src, at least one of them a register
        | ADD      -- dest += src, flags carry
        | SUB      -- dest -= src
        | IMUL2    -- dest *= src
        | SHL      -- dest <<= imm
        | SHR      -- dest >>= imm
        | SAL      -- dest <<= imm (synonym to shl)
        | SAR      -- dest >>= imm (arithmetic right shift)
        | AND      -- dest &= src
        | OR       -- dest |= src
        | XOR      -- dest xor= src
               deriving (Eq, Show)

isShift :: DS -> Bool
isShift i = i `elem` [SHL,SHR,SAL,SAR]

-- destructive instruction with dest only
data D  = POP      -- pop off stack into dest, adding 4 to ESP
        | NEG      -- dest = -dest
        | NOT      -- dest := !dest
        | INC      -- dest++
        | DEC      -- dest--
               deriving (Eq, Show)

data Target = Symbolic Label 
            | Index Int32
            | BuiltinPrintln 
            | BuiltinWrite 
            | BuiltinRead 
            | BuiltinRaise 
            | BuiltinHalloc
  deriving Eq
  
instance Show Target where
  show (Symbolic l) = l
  show (Index i) = "<line number " ++ (show i) ++ ">"
  show BuiltinPrintln = "L_println_int"
  show BuiltinWrite = "L_write"
  show BuiltinRead = "L_read"
  show BuiltinRaise = "L_raise"
  show BuiltinHalloc = "L_halloc"
  
data Instr
  = DS DS Dest Src -- dest ?= src, not two mems
  | D  D  Dest     -- modifies dest
  | LEA Reg EA     -- load effective address into register
  | CMP Dest Src   -- not two mems, non-destructive
  | PUSH Src       -- push src onto stack, subtracting 4 from ESP
  | IMUL Src'      -- (edx, eax) := eax * src
  | IDIV Src'      -- eax := (edx, eax) div src,  edx := (edx,eax) mod src
  | CDQ            -- convert between signed 32bit and signed 64bit
  | JMP Target     -- jump, resolved by the assembler
  | J Cond Target  -- conditional jump
  | CALL Target     -- function call
  | RET            -- return from function call
  | ENTER Int32    -- set up local variables
  | LEAVE          -- esp := ebp, pop ebp
  | NOP            -- do nothing
  | LABEL Label

labels :: [Instr] -> Map Label Int32
labels is = labels' 0 is Map.empty
  where
    labels' _ [] acc = acc
    labels' n ((LABEL l) : is') acc = labels' (n + 1) is' (Map.insert l n acc)
    labels' n (_ : is') acc = labels' (n + 1) is' acc
  
labelsToAddr :: Map Label Int32 -> Instr -> Instr
labelsToAddr _ (CALL (Symbolic "L_raise")) = CALL BuiltinRaise
labelsToAddr _ (CALL (Symbolic "L_println_int")) =  CALL BuiltinPrintln
labelsToAddr _ (CALL (Symbolic "L_write")) = CALL BuiltinWrite
labelsToAddr _ (CALL (Symbolic "L_read")) = CALL BuiltinRead
labelsToAddr _ (CALL (Symbolic "L_halloc")) = CALL BuiltinHalloc
labelsToAddr m (CALL (Symbolic l)) = 
  case Map.lookup l m of
    Nothing -> CALL (Symbolic l)
    Just i -> CALL (Index i) 
labelsToAddr m (JMP (Symbolic l)) = JMP (Index (m Map.! l))
labelsToAddr m (J c (Symbolic l)) = J c (Index (m Map.! l))
labelsToAddr _ i = i
  
instance Pretty Reg32 where
  ppr = text . ('%':) . map toLower . show

instance Pretty Reg where
  ppr (Fixed r) = ppr r
  ppr (Flex  t) = ppr t

instance Pretty Scale where
  ppr S1 = text "1"
  ppr S2 = text "2"
  ppr S4 = text "4"
  ppr S8 = text "8"

ppr_displacement :: (Show a, Ord a, Num a) => a -> Doc
ppr_displacement n
  | n == 0 = empty
  | n > 0 = text "+" <> text (show n)
  | n < 0 = text "-" <> text (show (-n))
ppr_displacement _ = empty

sepBy :: Doc -> Doc -> Doc -> Doc
sepBy s d1 d2 | isEmpty d2 = d1
              | isEmpty d1 = d2
              | otherwise  = d1 <> s <> d2

instance Pretty EA where
  ppr (EA r ms mr n) =
    (sepBy (text "+") (sepBy (text "*") (ppr r) (ppr ms)) (ppr mr))
      <> ppr_displacement n

instance Pretty Dest where
  ppr (Reg r)         = ppr r
  ppr (Mem ea) = text "DWORD PTR [" <> ppr ea <> text "]"

instance Pretty Src where
  ppr (Dest d) = ppr d
  ppr (Imm i)  = text $ show i

instance Pretty Cond where
  ppr = text . map toLower . show

instance Pretty DS where
  ppr IMUL2 = text "imul"
  ppr ds    = text . map toLower . show $ ds

instance Pretty D where
  ppr = text . map toLower . show

instance Pretty Target where
  ppr = text . show
  
instance Pretty Instr where
  ppr (DS c d s) = nest 8 $ ppr c $$ (nest 8 $ ppr d <> comma <+> ppr s)
  ppr (D c  d)   = nest 8 $ ppr c $$ (nest 8 $ ppr d)
  ppr (LEA r ea) = nest 8 $ text "lea"  $$ (nest 8 $ ppr r <> comma <+> (text "DWORD PTR [" <> ppr ea <> text "]"))
  ppr (CMP d s)  = nest 8 $ text "cmp"  $$ (nest 8 $ ppr d <> comma <+> ppr s)
  ppr (PUSH s)   = nest 8 $ text "push" $$ (nest 8 $ ppr s)
  ppr (IMUL s)   = nest 8 $ text "imul" $$ (nest 8 $ ppr s)
  ppr (IDIV s)   = nest 8 $ text "idiv" $$ (nest 8 $ ppr s)
  ppr (CDQ)      = nest 8 $ text "cdq"
  ppr (JMP l)    = nest 8 $ text "jmp"  $$ (nest 8 $ ppr l)
  ppr (J c l)    = nest 8 $ text "j" <> ppr c $$ (nest 8 $ ppr l)
  ppr (CALL l)   = nest 8 $ text "call" $$ (nest 8 $ ppr l)
  ppr (RET)      = nest 8 $ text "ret"
  ppr (ENTER i)  = nest 8 $ text "enter" $$ (nest 8 $ text (show i) <> comma <+> text "0")
  ppr (LEAVE)    = nest 8 $ text "leave"
  ppr (NOP)      = nest 8 $ text "nop"
  ppr (LABEL l)  = text l <> text ":"

instance Pretty [Instr] where
    ppr [] = empty
    ppr (s:ss) = (ppr s) $$ ppr ss

instance Show Instr where
  show = render . ppr
