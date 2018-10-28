package minijava.syntax;

/**
 * Represents {@code left op right}.
 */
public class ExpBinOp extends Exp {

  public enum Op {

    // note: there is no OR in MiniJava
    PLUS("+"), MINUS("-"), TIMES("*"), DIV("/"), AND("&&"), LT("<");

    private final String name;

    Op(String name) {
      this.name = name;
    }

    @Override
    public String toString() {
      return name;
    }
  }

  private final Exp left;
  private final Op op;
  private final Exp right;

  public ExpBinOp(Exp e1, Op op, Exp e2) {
    this.left = e1;
    this.op = op;
    this.right = e2;
  }

  public Exp getLeft() {
    return left;
  }

  public Op getOp() {
    return op;
  }

  public Exp getRight() {
    return right;
  }

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T {
    return v.visit(this);
  }
}
