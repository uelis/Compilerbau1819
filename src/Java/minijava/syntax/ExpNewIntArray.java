package minijava.syntax;

/**
 * Represents {@code new int[size]}.
 */
public class ExpNewIntArray extends Exp {

  private final Exp size;

  public ExpNewIntArray(Exp size) {
    this.size = size;
  }

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T {
    return v.visit(this);
  }

  public Exp getSize() {
    return size;
  }
}
