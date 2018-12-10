package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;

import java.util.*;
import java.util.function.Function;

final class InstrNullary implements MachineInstruction {

  enum Kind {
    RET, LEAVE, NOP
  }

  private final Kind kind;

  InstrNullary(Kind kind) {
    this.kind = kind;
  }

  @Override
  public List<Temp> use() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public List<Temp> def() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public List<Label> jumps() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public boolean isFallThrough() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public Pair<Temp, Temp> isMoveBetweenTemps() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public Label isLabel() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public String toString() {
    return "\t" + kind + "\n";
  }

  @Override
  public void rename(Function<Temp, Temp> sigma) {
     throw new UnsupportedOperationException("Needed later for register allocation.");
 }
}
