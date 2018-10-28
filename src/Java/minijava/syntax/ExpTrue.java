package minijava.syntax;

/**
 * Represents {@code true}.
 */
public class ExpTrue extends Exp {

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T{
    return v.visit(this);
  }
}
