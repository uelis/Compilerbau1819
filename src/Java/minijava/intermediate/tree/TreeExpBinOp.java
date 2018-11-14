package minijava.intermediate.tree;

public class TreeExpBinOp extends TreeExp {

  public enum Op {
    PLUS, MINUS, MUL, DIV, AND, OR, LSHIFT, RSHIFT, ARSHIFT, XOR
  }

  private final Op op;
  private final TreeExp left;
  private final TreeExp right;

  public TreeExpBinOp(Op op, TreeExp left, TreeExp right) {
    if (op == null || left == null || right == null) {
      throw new NullPointerException();
    }
    this.op = op;
    this.left = left;
    this.right = right;
  }

  public Op getOp() {
    return op;
  }

  public TreeExp getLeft() {
    return left;
  }

  public TreeExp getRight() {
    return right;
  }


  @Override
  public <A> A accept(TreeExpVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    return "BINOP(" + getOp() + ", " + getLeft() + ", " + getRight() + ")";
  }

}
