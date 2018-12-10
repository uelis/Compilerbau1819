{-# LANGUAGE MultiParamTypeClasses #-}
module X86Prg (
  X86Prg(..)
  ) where

import Backend
import X86Instr
import X86Function

data X86Prg = X86Prg { x86Functions :: [X86Function] }

instance MachinePrg X86Prg X86Function X86Instr where
  machinePrgFunctions = x86Functions
  replaceFunctions p m = p { x86Functions = m }

instance Show X86Prg where
  show prg = error "TODO"
