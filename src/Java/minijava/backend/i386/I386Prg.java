package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.backend.MachineFunction;
import minijava.backend.MachinePrg;

import java.util.Iterator;
import java.util.List;

public class I386Prg implements MachinePrg {

  private final List<I386Function> functions;

  I386Prg(List<I386Function> functions) {
    this.functions = functions;
  }

  @Override
  public String renderAssembly() {
    StringBuilder s = new StringBuilder();
    s.append("\t.intel_syntax\n");
    s.append("\t.global Lmain\n");
    for (I386Function m : functions) {
      renderFunction(m, s);
    }
    return s.toString();
  }

  private void renderFunction(I386Function function, StringBuilder s) {
    s.append(function.getName());
    s.append(":\n");
    for (MachineInstruction i : function) {
      s.append(i);
    }
  }

  @Override
  public Iterator<MachineFunction> iterator() {
    return new Iterator<MachineFunction>() {
      final Iterator<I386Function> iterator = functions.iterator();

      @Override
      public boolean hasNext() {
        return iterator.hasNext();
      }

      @Override
      public MachineFunction next() {
        return iterator.next();
      }
    };
  }


}

