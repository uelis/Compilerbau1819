{-# LANGUAGE FunctionalDependencies  #-}
module Backend where

import Tree(Prg)
import Names(Temp, Label, MonadNameGen)

class MachineInstr i where
  use  :: i -> [Temp]
  def  :: i -> [Temp]
  jumps :: i -> [Label]
  isFallThrough :: i -> Bool
  isMoveBetweenTemps :: i -> Maybe (Temp, Temp)
  isAssignmentToTemp :: i -> Maybe Temp
  isLabel :: i -> Maybe Label
  renameInstr :: i -> (Temp -> Temp) -> i

class (MachineInstr i) => MachineFunction f i | f -> i where
  machineFunctionName :: f -> String
  machineFunctionBody :: f -> [i]
  machineFunctionRename :: f -> (Temp -> Temp) -> f
  machineFunctionSpill :: MonadNameGen m => f -> [Temp] -> m f

class (MachineInstr i, MachineFunction f i, Show p) => MachinePrg p f i | p -> f i where
  machinePrgFunctions :: p -> [f]
  replaceFunctions :: p -> [f] -> p

class (MachineInstr i, MachineFunction f i, MachinePrg p f i) => CodeGen c p f i | c -> p f i where
  codeGen :: MonadNameGen m => c -> Prg -> m p
  allRegisters :: c -> [Temp]
  generalPurposeRegisters :: c -> [Temp]
