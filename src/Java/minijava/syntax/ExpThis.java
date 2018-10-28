package minijava.syntax;

/**
 * Represents {@code this}.
 */
public class ExpThis extends Exp {

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T {
    return v.visit(this);
  }
}
