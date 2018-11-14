module Tokens where

data TokenKind = Quote
               | LPar
               | RPar
               | LBrace
               | RBrace
               | Comma
               | Minus
               | KwMOVE
               | KwNAME
               | KwLABEL
               | KwTEMP
               | KwPARAM
               | KwCONST
               | KwESEQ
               | KwMEM
               | KwBINOP
               | KwSEQ
               | KwCALL
               | KwJUMP
               | KwCJUMP
               | KwMUL
               | KwDIV
               | KwPLUS
               | KwMINUS
               | KwAND
               | KwOR
               | KwXOR
               | KwLSHIFT
               | KwRSHIFT
               | KwARSHIFT
               | KwEQ
               | KwNE
               | KwLT
               | KwGT
               | KwLE
               | KwGE
               | KwULT
               | KwUGT
               | KwULE
               | KwUGE
               | KwReturn
               | Const Integer
               | Label String
               | Register String
               | Id String
               deriving (Eq, Read, Show)

data Token a = Token { kind :: TokenKind
                     , token_pos :: a
                     }

mkToken :: TokenKind -> a -> b -> Token a
mkToken k p _ = Token { kind = k, token_pos = p }
