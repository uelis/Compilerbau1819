package minijava.backend;

import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.function.Function;

/**
 * Interface of machine instructions in different backends.
 */
public interface MachineInstruction {

  /**
   * List of all (maybe more) temporaries that are used by the instruction.
   *
   * @return used temporaries
   */
  Iterable<Temp> use();

  /**
   * List of all (maybe more) temporaries that are defined by the instruction.
   *
   * @return defined temporaries
   */
  Iterable<Temp> def();

  /**
   * List of all possible labels (maybe more) that the instruction may jump to.
   *
   * @return possible jump targets
   */
  Iterable<Label> jumps();

  /**
   * Returns {@code true} if after executing this instruction, execution may resume
   * at the next instruction in the assembly text. This will be true for most instructions.
   * Jumps are examples of instructions that are not fall-through.
   *
   * @return {@code true} if instruction may fall through to the next instruction
   */
  boolean isFallThrough();

  /**
   * Returns a pair {@code (s,t)} if the instruction is an assignment with the effect {@code s:=t},
   * where both {@code s} and {@code t} are temporaries. Otherwise returns {@code null}.
   *
   * @return a pair of {@code (s,t)} if the instruction is a move of {@code t} to {@code s}; otherwise {@code null}
   */
  Pair<Temp, Temp> isMoveBetweenTemps();

  /**
   * Returns the label if the instruction is a label, otherwise {@code null}.
   *
   * @return label if the instruction defines a label, {@code null} otherwise
   */
  Label isLabel();

  /**
   * Renames the temporaries in the instruction according to the function {@code sigma}.
   * This method is effectful and will modify the instruction so that each temporary {@code t} is
   * replaced by {@code sigma(t)}.
   *
   * @param sigma renaming function.
   */
  void rename(Function<Temp, Temp> sigma);
}
