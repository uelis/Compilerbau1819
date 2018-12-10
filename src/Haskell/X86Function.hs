{-# LANGUAGE MultiParamTypeClasses #-}
module X86Function where

import Backend
import X86Instr

data X86Function = X86Function { x86FunctionName:: String,
                                 x86FunctionBody:: [X86Instr] }

mkX86Function name body =
  X86Function { x86FunctionName = name,
                x86FunctionBody = body }

instance MachineFunction X86Function X86Instr where
  machineFunctionName = x86FunctionName
  machineFunctionBody = x86FunctionBody

  machineFunctionRename m sigma = error "needed later for register allocation"
  machineFunctionSpill m toSpill = error "needed later for register allocation"
