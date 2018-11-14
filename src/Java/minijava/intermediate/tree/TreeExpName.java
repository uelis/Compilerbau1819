package minijava.intermediate.tree;

import minijava.intermediate.Label;

public class TreeExpName extends TreeExp {

  private final Label label;

  public TreeExpName(Label label) {
    if (label == null) {
      throw new NullPointerException();
    }
    this.label = label;
  }

  public Label getLabel() {
    return label;
  }

  @Override
  public <A> A accept(TreeExpVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    return "NAME(" + getLabel() + ")";
  }

}
