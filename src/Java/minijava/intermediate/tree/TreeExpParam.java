package minijava.intermediate.tree;

public class TreeExpParam extends TreeExp {
  private final int number;

  public TreeExpParam(int number) {
    this.number = number;
  }

  public int getNumber() {
    return number;
  }

  @Override
  public <A> A accept(TreeExpVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    return "PARAM(" + getNumber() + ")";
  }


}
