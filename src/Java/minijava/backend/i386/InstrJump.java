package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Function;

final class InstrJump implements MachineInstruction {

  enum Kind {
    JMP, J, CALL
  }

  enum Cond {
    E, NE, L, LE, G, GE, Z
  }

  private final Kind kind;
  private final Label label;
  private Operand dest;
  private final Cond cond;

  InstrJump(Kind kind, Label label) {
    this(kind, label, null, null);
  }

  InstrJump(Kind kind, Operand dest) {
    this(kind, null, dest, null);
  }

  InstrJump(Cond cond, Label label) {
    this(Kind.J, label, null, cond);
  }

  InstrJump(Kind kind, Label label, Operand dest, Cond cond) {
    assert (kind != Kind.J || cond != null) : "J needs condition argument";
    assert (kind == Kind.CALL || label != null) : "J and JMP need label as destination";
    assert (dest == null || dest instanceof Operand.Reg) : "dynamic destination of CALL must be Reg";
    this.kind = kind;
    this.label = label;
    this.dest = dest;
    this.cond = cond;
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
    String ins = (kind == Kind.J) ? (kind.toString() + cond.toString()) : kind.toString();
    return "\t" + ins + " " + (label != null ? label : dest) + "\n";
  }

  @Override
  public void rename(Function<Temp, Temp> sigma) {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }
}
