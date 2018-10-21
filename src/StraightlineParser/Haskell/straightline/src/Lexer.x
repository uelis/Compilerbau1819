{
module Lexer where

import Tokens
}

%wrapper "posn"

$digit = 0-9        -- digits
$alpha = [a-zA-Z]   -- alphabetic characters
$letter = $alpha 

tokens :-
  $white+;
  "//".*;
  "("	     { mkToken LPar }
  ")"	     { mkToken RPar }
  "print"  { mkToken Print }
  "="      { mkToken Eq } 
  "+"      { mkToken Plus }
  "-"      { mkToken Minus } 
  "*"      { mkToken Times }
  "/"      { mkToken Divide }
  ","	     { mkToken Comma }
  ";"	     { mkToken Semicolon }
  $digit+  { \p s -> mkToken (Num (read s)) p s }
  $letter [$letter $digit \_ \']* 
           { \ p s  -> mkToken (Id s) p s }