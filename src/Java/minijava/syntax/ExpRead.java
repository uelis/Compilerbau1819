package minijava.syntax;

/**
 * Represents {@code System.in.read()}.
 */
public class ExpRead extends Exp {

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T {
    return v.visit(this);
  }
}
