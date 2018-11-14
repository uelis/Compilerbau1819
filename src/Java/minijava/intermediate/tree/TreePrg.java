package minijava.intermediate.tree;

import java.util.Iterator;
import java.util.List;

public final class TreePrg implements Iterable<TreeFunction> {

  private final List<TreeFunction> functions;

  public TreePrg(List<TreeFunction> functions) {
    this.functions = functions;
  }

  @Override
  public String toString() {
    StringBuilder s = new StringBuilder();
    for (TreeFunction f : functions) {
      s.append(f);
      s.append("\n");
    }
    return s.toString();
  }

  @Override
  public Iterator<TreeFunction> iterator() {
    return functions.iterator();
  }
}
