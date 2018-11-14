package minijava.intermediate.tree;

public class TreeStmMove extends TreeStm {

  private final TreeExp dst;
  private final TreeExp src;

  public TreeStmMove(TreeExp dst, TreeExp src) {
    if (dst == null || src == null) {
      throw new NullPointerException();
    }
    this.dst = dst;
    this.src = src;
  }

  public TreeExp getDst() {
    return dst;
  }

  public TreeExp getSrc() {
    return src;
  }

  @Override
  public <A> A accept(TreeStmVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    return "MOVE(" + getDst() + ", " + getSrc() + ")";
  }
}
