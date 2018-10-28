package minijava.syntax;

/**
 * Represents {@code false}.
 */
public class ExpFalse extends Exp {

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T {
    return v.visit(this);
  }
}
