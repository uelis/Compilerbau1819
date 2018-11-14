package minijava.intermediate.tree;

import minijava.intermediate.Label;

import java.util.Arrays;
import java.util.List;

public class TreeExpCall extends TreeExp {

  private final TreeExp func;
  private final List<TreeExp> args;

  public TreeExpCall(TreeExp func, List<TreeExp> args) {
    if (func == null || args == null) {
      throw new NullPointerException();
    }
    this.func = func;
    this.args = args;
  }

  public TreeExp getFunction() {
    return func;
  }

  public List<TreeExp> getArguments() {
    return args;
  }

  @Override
  public <A> A accept(TreeExpVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    StringBuilder s = new StringBuilder("CALL(" + getFunction());
    for (TreeExp arg : getArguments()) {
      s.append(", ").append(arg);
    }
    s.append(")");
    return s.toString();
  }

  public static TreeExp name(String name, TreeExp... args) {
    return new TreeExpCall(new TreeExpName(new Label(name)), Arrays.asList(args));
  }

}
