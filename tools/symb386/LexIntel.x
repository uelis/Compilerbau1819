{
module LexIntel where

import Intel (Register(..))
import TokenIntel as Token
}

%wrapper "posn"

$digit = 0-9        -- digits
$alpha = [a-zA-Z]   -- alphabetic characters
$letter = $alpha

tokens :-

  $white+;

  "# ".*  ;  -- one-line comments start with a hash and space
  ".".*  ;  -- ignore all pragmas, starting with a dot (simplified)

  "["{ mkToken LBrack }
  "]"{ mkToken RBrack }
  ":"{ mkToken Colon }
  ","{ mkToken Comma }
  "."{ mkToken Dot }
  "+"{ mkToken Plus }
  "-"{ mkToken Minus }
  "*"{ mkToken Times }

  MOV  { mkToken Mov }
  ADD  { mkToken Add }
  SUB  { mkToken Sub }
  SHL  { mkToken Shl }
  SHR  { mkToken Shr }
  SAL  { mkToken Sal }
  SAR  { mkToken Sar }
  AND  { mkToken And }
  OR   { mkToken Or }
  XOR  { mkToken Xor }
  NEG  { mkToken Neg }
  NOT  { mkToken Not }
  INC  { mkToken Inc }
  DEC  { mkToken Dec }
  POP  { mkToken Pop }
  PUSH { mkToken Push }
  IMUL { mkToken Imul }
  IDIV { mkToken Idiv }
  JMP  { mkToken Jmp }
  LEA  { mkToken Lea }
  CMP  { mkToken Cmp }
  CDQ  { mkToken Cdq }
  JE   { mkToken Je }
  JNE  { mkToken Jne }
  JL   { mkToken Jl }
  JLE  { mkToken Jle }
  JG   { mkToken Jg }
  JGE  { mkToken Jge }
  CALL { mkToken Call }
  RET  { mkToken Ret }
  ENTER{ mkToken Enter }
  LEAVE{ mkToken Leave }
  NOP  { mkToken Nop }
  mov  { mkToken Mov }
  add  { mkToken Add }
  sub  { mkToken Sub }
  shl  { mkToken Shl }
  shr  { mkToken Shr }
  sal  { mkToken Sal }
  sar  { mkToken Sar }
  and  { mkToken And }
  or   { mkToken Or }
  xor  { mkToken Xor }
  neg  { mkToken Neg }
  not  { mkToken Not }
  inc  { mkToken Inc }
  dec  { mkToken Dec }
  pop  { mkToken Pop }
  push { mkToken Push }
  imul { mkToken Imul }
  idiv { mkToken Idiv }
  jmp  { mkToken Jmp }
  lea  { mkToken Lea }
  cmp  { mkToken Cmp }
  cdq  { mkToken Cdq }
  je   { mkToken Je }
  jne  { mkToken Jne }
  jl   { mkToken Jl }
  jle  { mkToken Jle }
  jg   { mkToken Jg }
  jge  { mkToken Jge }
  call { mkToken Call }
  ret  { mkToken Ret }
  enter{ mkToken Enter }
  leave{ mkToken Leave }
  nop  { mkToken Nop }

  DWORD{ mkToken Dword }
  dword{ mkToken Dword }
  PTR  { mkToken Token.Ptr }
  ptr  { mkToken Token.Ptr }

  $digit+{ \p s -> mkToken (Nat (read s)) p s }
  "t"[$letter $digit]*    { \ p ('t':s) -> mkToken (Temp s) p s }
  "eax" { mkToken (Reg eax) }
  "ebx" { mkToken (Reg ebx) }
  "ecx" { mkToken (Reg ecx) }
  "edx" { mkToken (Reg edx) }
  "esi" { mkToken (Reg esi) }
  "edi" { mkToken (Reg edi) }
  "ebp" { mkToken (Reg ebp) }
  "esp" { mkToken (Reg esp) }
  "%eax" { mkToken (Reg eax) }
  "%ebx" { mkToken (Reg ebx) }
  "%ecx" { mkToken (Reg ecx) }
  "%edx" { mkToken (Reg edx) }
  "%esi" { mkToken (Reg esi) }
  "%edi" { mkToken (Reg edi) }
  "%ebp" { mkToken (Reg ebp) }
  "%esp" { mkToken (Reg esp) }
  [$letter \_ \$] [$letter $digit \_ \' \$]*{ \p s -> mkToken (Id s) p s }

{

}
