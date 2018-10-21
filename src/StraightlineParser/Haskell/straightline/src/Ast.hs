module Ast where

type Identifier = String

data BinOp = OpPlus |  OpMinus |  OpTimes | OpDiv
             deriving (Show, Ord, Eq)

data Stm = SeqStm    Stm Stm
         | AssignStm Identifier Exp 
         | PrintStm  [Exp]
         deriving (Show,Eq)

data Exp = IdExp   Identifier
         | NumExp  Int
         | OpExp   Exp BinOp Exp
         | ESeqExp Stm Exp
         deriving (Show,Eq)