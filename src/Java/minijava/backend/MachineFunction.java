package minijava.backend;

import minijava.intermediate.Temp;

import java.util.List;
import java.util.function.Function;

/**
 * Interface of the representations of single assembly code functions in different backends.
 * <p>
 * It extends {@code Iterable<MachineInstruction>} to allow iteration over its instructions.
 */
public interface MachineFunction extends Iterable<MachineInstruction> {

  /**
   * Renames all temporaries in the function according to function {@code sigma}.
   * This method has the side effect of modifying the function.
   *
   * @param sigma renaming of temporaries
   */
  void rename(Function<Temp, Temp> sigma);

  /**
   * Modifies the function so that the temporaries in {@code toSpill} are spilled on the stack.
   *
   * @param toSpill temporaries to spill
   */
  void spill(List<Temp> toSpill);
}
