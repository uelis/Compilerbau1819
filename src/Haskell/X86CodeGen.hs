{-# LANGUAGE MultiParamTypeClasses #-}
module X86CodeGen (X86CodeGen(..)) where

import Backend
import X86Instr
import X86Function
import X86Prg

-----------------------------------------
-- Code generation
-----------------------------------------

data X86CodeGen = X86CodeGen

instance CodeGen X86CodeGen X86Prg X86Function X86Instr where
  codeGen X86CodeGen = error "TODO"
  allRegisters X86CodeGen = error "needed later for register allocation"
  generalPurposeRegisters X86CodeGen = error "needed later for register allocation"
