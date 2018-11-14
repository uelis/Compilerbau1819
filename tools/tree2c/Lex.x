{
module Lex where
import Tokens
}

%wrapper "posn"

$digit = 0-9        -- digits
$alpha = [a-zA-Z]   -- alphabetic characters
$letter = $alpha

tokens :-

  $white+;
  "//".* ;
  "           { mkToken Quote }
  "("         { mkToken LPar }
  ")"         { mkToken RPar }
  "{"         { mkToken LBrace }
  "}"         { mkToken RBrace }
  ","         { mkToken Comma }
  "-"         { mkToken Minus }
  MOVE        { mkToken KwMOVE }
  NAME        { mkToken KwNAME }
  LABEL       { mkToken KwLABEL }
  TEMP        { mkToken KwTEMP }
  PARAM       { mkToken KwPARAM }
  CONST       { mkToken KwCONST }
  ESEQ        { mkToken KwESEQ }
  MEM         { mkToken KwMEM }
  BINOP       { mkToken KwBINOP }
  SEQ         { mkToken KwSEQ }
  CALL        { mkToken KwCALL }
  JUMP        { mkToken KwJUMP }
  CJUMP       { mkToken KwCJUMP }
  MUL         { mkToken KwMUL }
  PLUS        { mkToken KwPLUS }
  MINUS       { mkToken KwMINUS }
  DIV         { mkToken KwDIV }
  AND         { mkToken KwAND }
  OR          { mkToken KwOR }
  XOR         { mkToken KwXOR }
  LSHIFT      { mkToken KwLSHIFT }
  RSHIFT      { mkToken KwRSHIFT }
  ARSHIFT     { mkToken KwARSHIFT }
  EQ          { mkToken KwEQ }
  NE          { mkToken KwNE }
  LT          { mkToken KwLT }
  GT          { mkToken KwGT }
  LE          { mkToken KwLE }
  GE          { mkToken KwGE }
  ULT         { mkToken KwULT }
  UGT         { mkToken KwUGT }
  ULE         { mkToken KwULE }
  UGE         { mkToken KwUGE }
  return      { mkToken KwReturn }
  $digit+     { \p s -> mkToken (Const (read s)) p s }
  $letter [$letter $digit \_ \' \$]*
              { \p s -> mkToken (Id s) p s }
