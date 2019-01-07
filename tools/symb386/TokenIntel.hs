module TokenIntel where

import Intel (Reg32(..))

data TokenKind =
-- punctuation
   LBrack
 | RBrack
 | Dot
 | Comma
 | Colon
 | Plus 
 | Minus
 | Times
-- instructions
 | Mov
 | Add
 | Sub
 | Shl
 | Shr
 | Sal
 | Sar
 | And
 | Or
 | Xor
 | Neg
 | Not
 | Inc
 | Dec
 | Pop
 | Push
 | Imul
 | Idiv
 | Jmp
 | Lea
 | Cmp
 | Cdq
 | Je
 | Jne
 | Jl
 | Jle
 | Jg
 | Jge
 | Call
 | Ret
 | Enter
 | Leave
 | Nop
-- addressing keywords
 | Dword
 | Ptr
-- identifiers and constants
 | Nat Int       -- positive number or zero
 | Label String
 | Reg Reg32
 | Temp String
 | Id String
 deriving Show

data Token a = Token { kind :: TokenKind
                     , token_pos :: a
                     }
  deriving Show

mkToken :: TokenKind -> a -> b -> Token a
mkToken k p _ = Token { kind = k, token_pos = p }
