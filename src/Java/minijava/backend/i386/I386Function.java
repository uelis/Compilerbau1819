package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.backend.MachineFunction;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;

import java.util.*;
import java.util.function.Function;

final class I386Function implements MachineFunction {

  private final Label name;
  private List<MachineInstruction> body;

  I386Function(Label name, List<MachineInstruction> body) {
    this.name = name;
    this.body = body;
  }

  public Label getName() {
    return name;
  }

  @Override
  public Iterator<MachineInstruction> iterator() {
    return body.iterator();
  }

  @Override
  public void rename(Function<Temp, Temp> sigma) {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public void spill(List<Temp> toSpill) {
    throw new UnsupportedOperationException("Needed later for register allocation.");
 }
}
