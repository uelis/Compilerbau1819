package minijava.intermediate.tree;

public class TreeExpConst extends TreeExp {
  private final int value;

  public TreeExpConst(int value) {
    this.value = value;
  }

  public int getValue() {
    return value;
  }

  @Override
  public <A> A accept(TreeExpVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    return "CONST(" + getValue() + ")";
  }

}
