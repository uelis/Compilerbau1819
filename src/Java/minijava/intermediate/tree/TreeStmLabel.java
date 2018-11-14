package minijava.intermediate.tree;

import minijava.intermediate.Label;

public class TreeStmLabel extends TreeStm {

  private final Label label;

  public TreeStmLabel(Label label) {
    if (label == null) {
      throw new NullPointerException();
    }
    this.label = label;
  }

  public Label getLabel() {
    return label;
  }

  @Override
  public <A> A accept(TreeStmVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    return "LABEL(" + getLabel() + ")";
  }
}
