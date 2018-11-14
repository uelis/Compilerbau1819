package minijava.intermediate.tree;

import minijava.intermediate.Label;

import java.util.Collections;
import java.util.List;

public class TreeStmJump extends TreeStm {
  private final TreeExp dest;
  private final List<Label> possibleTargets;

  public TreeStmJump(TreeExp dest, List<Label> possibleTargets) {
    if (dest == null || possibleTargets == null) {
      throw new NullPointerException();
    }
    this.dest = dest;
    this.possibleTargets = possibleTargets;
  }

  public TreeExp getDst() {
    return dest;
  }

  public List<Label> getPossibleTargets() {
    return possibleTargets;
  }

  public TreeStmJump(Label l) {
    this(new TreeExpName(l), Collections.singletonList(l));
  }

  @Override
  public <A> A accept(TreeStmVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    StringBuilder s = new StringBuilder("JUMP(" + getDst() + ", ");
    String sep = "";
    for (Label l : getPossibleTargets()) {
      s.append(sep).append(l);
      sep = ", ";
    }
    s.append(")");
    return s.toString();
  }

}
