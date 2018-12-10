package minijava.backend;

/**
 * Interface of assembly program representations in different backends.
 * <p>
 * It extends {@code Iterable<MachineFunction>} to allow iteration over its functions.
 */
public interface MachinePrg extends Iterable<MachineFunction> {

  /**
   * Renders the program as assembly text that may be compiled with a system assembler.
   *
   * @return program as assembly text
   */
  String renderAssembly();
}
