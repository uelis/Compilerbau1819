{
module Parse  where

import Data.Int
import Lex
import qualified Tokens
import Names
import Tree
}

%tokentype { (Tokens.Token AlexPosn) }

%name parse

%token
  '"'	     	 { Tokens.Token Tokens.Quote _ }
  '('	       { Tokens.Token Tokens.LPar _ }
  ')'	       { Tokens.Token Tokens.RPar _ }
  '{'	       { Tokens.Token Tokens.LBrace _ }
  '}'	       { Tokens.Token Tokens.RBrace _ }
  ',' 	     { Tokens.Token Tokens.Comma _ }
  '-' 	     { Tokens.Token Tokens.Minus _ }
  MOVE       { Tokens.Token Tokens.KwMOVE _ }
  NAME       { Tokens.Token Tokens.KwNAME _ }
  LABEL      { Tokens.Token Tokens.KwLABEL _ }
  CONST      { Tokens.Token Tokens.KwCONST _ }
  ESEQ       { Tokens.Token Tokens.KwESEQ _ }
  TEMP       { Tokens.Token Tokens.KwTEMP _ }
  PARAM      { Tokens.Token Tokens.KwPARAM _ }
  MEM        { Tokens.Token Tokens.KwMEM _ }
  BINOP      { Tokens.Token Tokens.KwBINOP _ }
  SEQ        { Tokens.Token Tokens.KwSEQ _ }
  CALL       { Tokens.Token Tokens.KwCALL _ }
  JUMP       { Tokens.Token Tokens.KwJUMP _ }
  CJUMP      { Tokens.Token Tokens.KwCJUMP _ }
  MUL        { Tokens.Token Tokens.KwMUL _ }
  PLUS       { Tokens.Token Tokens.KwPLUS _ }
  MINUS      { Tokens.Token Tokens.KwMINUS _ }
  DIV        { Tokens.Token Tokens.KwDIV _ }
  AND        { Tokens.Token Tokens.KwAND _ }
  OR         { Tokens.Token Tokens.KwOR _ }
  XOR        { Tokens.Token Tokens.KwXOR _ }
  LSHIFT     { Tokens.Token Tokens.KwLSHIFT _ }
  RSHIFT     { Tokens.Token Tokens.KwRSHIFT _ }
  ARSHIFT    { Tokens.Token Tokens.KwARSHIFT _ }
  EQ         { Tokens.Token Tokens.KwEQ _ }
  NE         { Tokens.Token Tokens.KwNE _ }
  LT         { Tokens.Token Tokens.KwLT _ }
  GT         { Tokens.Token Tokens.KwGT _ }
  LE         { Tokens.Token Tokens.KwLE _ }
  GE         { Tokens.Token Tokens.KwGE _ }
  ULT        { Tokens.Token Tokens.KwULT _ }
  UGT        { Tokens.Token Tokens.KwUGT _ }
  ULE        { Tokens.Token Tokens.KwULE _ }
  UGE        { Tokens.Token Tokens.KwUGE _ }
  return     { Tokens.Token Tokens.KwReturn _ }
  integer    { Tokens.Token (Tokens.Const $$) _ }
  identifier { Tokens.Token (Tokens.Id $$) _ }

%%

Prg :: { (Prg) }
Prg:
    MethodList { Prg { methods = $1 } }

MethodList :: { [Method] }
MethodList:
    {- empty -} {[]}
  | Method MethodList { $1:$2 }

Method :: { Method }
Method:
    identifier '(' integer ')' '{' Stms return identifier '}'
    { Method { methodname = $1, nparams = $3, body = $6, returnTemp = mkNamedTemp $8 } }

Stms :: { [Tree.Stm] }
Stms:
    { [] }
  | Stm Stms       { $1:$2 }

Stm :: { Tree.Stm }
Stm:
    MOVE '(' Exp ',' Exp ')'       { Tree.MOVE $3 $5 }
  | JUMP '(' Exp ',' LabelList ')' { Tree.JUMP $3 $5 }
  | CJUMP '(' Rel ',' Exp ',' Exp ',' identifier ',' identifier ')'
    { Tree.CJUMP $3 $5 $7 $9 $11 }
  | SEQ '(' Seq ')'                { Tree.SEQ $3 }
  | LABEL '(' identifier ')'       { Tree.LABEL $3 }
  |'(' Stm ')'                     { $2 }

Exp :: { Tree.Exp }
Exp:
    NAME '(' Label ')'     { Tree.NAME $3 }
  | TEMP '(' Temp ')'      { Tree.TEMP (mkNamedTemp $3) }
  | PARAM '(' integer ')'  { Tree.PARAM $3 }
  | CONST '(' Integer ')'  { Tree.CONST (asInt32 $3) }
  | BINOP '(' Op ',' Exp ',' Exp ')'  { Tree.BINOP $3 $5 $7 }
  | MEM  '(' Exp ')'       { Tree.MEM $3 }
  | CALL '(' Exp ')'       { Tree.CALL $3 [] }
  | CALL '(' Exp ',' Exps ')'       { Tree.CALL $3 $5 }
  | ESEQ '(' ESeq ')'      { let (s,e) = $3 in Tree.ESEQ (Tree.SEQ s) e }
  | '(' Exp ')'            { $2 }

Integer:
     integer { $1 }
  | '-' integer { 0-$2 }
  | '(' Integer ')' { $2 }

Temp:
     identifier { $1 }
  | '(' Temp ')' { $2 }

Label:
     identifier { $1 }
  | '"' identifier '"' { $2 }
  | '(' Label ')' { $2 }

ESeq:
    Exp          { ([], $1) }
  | Stm ESeq1    { let (s,e)=$2 in ($1:s, e) }

ESeq1:
    ',' Exp       { ([], $2)}
  | ',' Stm ESeq1 { let (s,e)=$3 in ($2:s, e) }

Seq:
                { [] }
  | Stm Seq1    { $1:$2 }

Seq1:
                 { [] }
  | ',' Stm Seq1 { $2:$3 }

Exps :: { [Tree.Exp] }
Exps: Exp { [$1] }
  |  Exp ',' Exps { $1:$3 }

LabelList :: { [Label] }
LabelList:      { [] }
  | identifier LabelList0 { $1:$2 }
  | '(' LabelList ')' { $2 }

LabelList0 :: { [Label] }
LabelList0:   { [] }
  | ',' identifier LabelList0 { $2:$3 }

Op :: { Tree.BinOp }
Op:
    MUL     { Tree.MUL }
  | PLUS    { Tree.PLUS }
  | MINUS   { Tree.MINUS }
  | DIV     { Tree.DIV }
  | AND     { Tree.AND }
  | OR      { Tree.OR }
  | XOR     { Tree.XOR }
  | LSHIFT  { Tree.LSHIFT }
  | RSHIFT  { Tree.RSHIFT }
  | ARSHIFT { Tree.ARSHIFT }
  | '(' Op ')' { $2 }

Rel :: { Tree.RelOp }
Rel:
    EQ  { Tree.EQ }
  | NE  { Tree.NE }
  | LT  { Tree.LT }
  | GT  { Tree.GT }
  | LE  { Tree.LE }
  | GE  { Tree.GE }
  | ULT { Tree.ULT }
  | UGT { Tree.UGT }
  | ULE { Tree.ULE }
  | UGE { Tree.UGE }
  | '(' Rel ')' { $2 }


{
asInt32 :: Integer -> Int32
asInt32 x = if x == fromIntegral y then y
            else error $ "Parse error: constant " ++ show x
                         ++ " does not fit in 32 bits."
  where y = (fromIntegral x :: Int32)

happyError :: [Tokens.Token AlexPosn] -> a
happyError tks = error ("Parse error at " ++ lcn ++ "\n")
	where
	lcn = case tks of
		  [] -> "end of file"
		  (tk : _) -> "line " ++ show l ++ ", column " ++ show c
			where AlexPn _ l c = Tokens.token_pos tk
}
