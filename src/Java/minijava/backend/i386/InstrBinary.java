package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Function;

final class InstrBinary implements MachineInstruction {

  enum Kind {
    MOV, ADD, SUB, SHL, SHR, SAL, SAR, AND, OR, XOR, TEST, CMP, LEA, IMUL
  }

  private Operand src;
  private Operand dst;
  private final Kind kind;

  InstrBinary(Kind kind, Operand dst, Operand src) {
    assert (kind != null && src != null && dst != null);
    assert (!((src instanceof Operand.Mem) && (dst instanceof Operand.Mem)));
    assert (kind != Kind.LEA || ((src instanceof Operand.Mem) && (dst instanceof Operand.Reg)));
    this.src = src;
    this.dst = dst;
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
    return "\t" + kind + " " + dst + ", " + src + "\n";
  }

  @Override
  public void rename(Function<Temp, Temp> sigma) {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }
}
