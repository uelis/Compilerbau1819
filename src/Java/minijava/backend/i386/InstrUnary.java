package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.backend.i386.Operand.Reg;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Function;

final class InstrUnary implements MachineInstruction {

  enum Kind {

    PUSH, POP, NEG, NOT, INC, DEC, IDIV
  }
  private Operand op;
  private final Kind kind;

  InstrUnary(Kind kind, Operand op) {
    assert (!(kind == Kind.POP || kind == Kind.NEG || kind == Kind.NOT
            || kind == Kind.INC || kind == Kind.DEC || kind == Kind.IDIV) || !(op instanceof Operand.Imm));
    this.op = op;
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
    return "\t" + kind + " " + op + "\n";
  }

  @Override
  public void rename(Function<Temp, Temp> sigma) {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }
}
