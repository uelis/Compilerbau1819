package minijava.intermediate.canon;

import minijava.intermediate.tree.TreeFunction;
import minijava.intermediate.tree.TreePrg;
import minijava.intermediate.tree.TreeStm;

import java.util.ArrayList;
import java.util.List;

/**
 * Main class for canonization. Use {@code canonPrg} to canonize a tree program.
 */
public class Canonizer {

  public TreePrg canonPrg(TreePrg prg) {
    List<TreeFunction> canonizedFunctions = new ArrayList<>();
    for (TreeFunction m : prg) {
      canonizedFunctions.add(canonFunction(m));
    }
    return new TreePrg(canonizedFunctions);
  }

  private TreeFunction canonFunction(TreeFunction function) {

    List<TreeStm> canonBody = new ArrayList<>();
    for (TreeStm s : function) {
      canonBody.addAll(s.accept(new CanonStm()));
    }
    return new TreeFunction(function.getName(), function.getNumberOfParameters(), canonBody, function.getReturnTemp());
  }

}
