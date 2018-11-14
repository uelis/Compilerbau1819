module Tree where

import Prelude hiding (EQ,GT,LT)
import Data.List
import Data.Int
import Names

data Prg = Prg { methods :: [Method] }

data Method = Method { methodname :: String
                     , nparams :: Integer
                     , body :: [Stm]
                     , returnTemp :: Temp
                     }

data Exp = CONST Int32
         | NAME Label
         | TEMP Temp
         | PARAM Integer
         | BINOP BinOp Exp Exp
         | MEM  Exp
         | CALL Exp [Exp]
         | ESEQ Stm Exp
         deriving Eq

data Stm = MOVE Exp Exp
         | JUMP Exp [Label]
         | CJUMP RelOp Exp Exp Label Label
         | SEQ [Stm]
         | LABEL Label
         deriving Eq

data BinOp = PLUS
           | MINUS
           | MUL
           | DIV
           | AND
           | OR
           | LSHIFT
           | RSHIFT
           | ARSHIFT
           | XOR
           deriving (Eq, Show)

data RelOp = EQ
           | NE
           | LT
           | GT
           | LE
           | GE
           | ULT
           | ULE
           | UGT
           | UGE
           deriving (Eq, Show)


-- The following Show instances shold produce tree programs
-- that are parseable using tree2c.
instance Show Prg where
  show prg = intercalate "\n\n" $ map show (methods prg)

instance Show Method where
  show m = methodname m ++ "(" ++ show (nparams m) ++ ") {\n  "
           ++ intercalate "\n  " (map show (body m))
           ++ "\n  return " ++ show (returnTemp m)
           ++ "\n}"

instance Show Exp where
  show (CONST i) = "CONST(" ++ show i ++ ")"
  show (NAME l) = "NAME(" ++ l ++ ")"
  show (TEMP t) = "TEMP(" ++ show t ++ ")"
  show (PARAM i) = "PARAM(" ++ show i ++ ")"
  show (BINOP o e1 e2) = "BINOP(" ++ show o ++ ", "
                                  ++ show e1 ++ ", " ++ show e2 ++ ")"
  show (MEM  e) = "MEM(" ++ show e ++ ")"
  show (CALL e es) = "CALL(" ++ intercalate ", " (map show (e:es)) ++ ")"
  show (ESEQ s e) = "ESEQ(" ++ show s ++ ", " ++ show e ++ ")"

instance Show Stm where
  show (MOVE e1 e2) = "MOVE(" ++ show e1 ++ ", " ++ show e2 ++ ")"
  show (JUMP e ls) = "JUMP(" ++ show e ++ ", " ++ intercalate ", " ls ++ ")"
  show (CJUMP r e1 e2 l1 l2) = "CJUMP(" ++ show r ++ ", "
                                        ++ show e1 ++ ", " ++ show e2 ++ ", "
                                        ++ l1 ++ ", " ++ l2 ++ ")"
  show (SEQ ss) = "SEQ(" ++ intercalate ", " (map show ss) ++ ")"
  show (LABEL l1) = "LABEL(" ++ l1 ++ ")"
