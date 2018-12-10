package minijava.backend.i386;

import minijava.backend.CodeGenerator;
import minijava.intermediate.Temp;
import minijava.intermediate.tree.TreeFunction;
import minijava.intermediate.tree.TreePrg;

import java.util.ArrayList;
import java.util.List;

public class I386CodeGenerator implements CodeGenerator {

  @Override
  public List<Temp> getAllRegisters() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public List<Temp> getGeneralPurposeRegisters() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public I386Prg codeGen(TreePrg prg) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

}
