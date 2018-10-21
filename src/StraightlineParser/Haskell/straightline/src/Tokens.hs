module Tokens where

data TokenKind = LPar
               | RPar
               | Print
               | Eq
               | Plus
               | Minus
               | Times
               | Divide
               | Comma
               | Semicolon
               | Num Int
               | Id String
               deriving (Eq, Read, Show)

data Token a = Token { kind :: TokenKind
                     , token_pos :: a
                     }

mkToken :: TokenKind -> a -> b -> Token a
mkToken k p _ = Token { kind = k, token_pos = p }
