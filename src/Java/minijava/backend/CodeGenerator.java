package minijava.backend;

import minijava.intermediate.Temp;
import minijava.intermediate.tree.TreePrg;

import java.util.List;

public interface CodeGenerator {

  /**
   * Returns an array of all machine registers.
   * <p>
   * May return {@code null} if the machine does not have registers.
   * In this case, an unlimited number of temporaries will be used.
   */
  List<Temp> getAllRegisters();

  /**
   * Returns an array of all general purpose registers that may be
   * used without restriction for register allocation.
   * <p>
   * May return {@code null} if the machine does not have registers.
   * In this case, an unlimited number of temporaries will be used.
   */
  List<Temp> getGeneralPurposeRegisters();

  /**
   * TreeMethod for compiling whole program.
   */
  MachinePrg codeGen(TreePrg frag);

}
