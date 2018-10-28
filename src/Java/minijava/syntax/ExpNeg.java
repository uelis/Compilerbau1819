package minijava.syntax;

/**
 * Represents {@code !exp}.
 */
public class ExpNeg extends Exp {

  private final Exp exp;

  public ExpNeg(Exp exp) {
    this.exp = exp;
  }

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T {
    return v.visit(this);
  }

  public Exp getExp() {
    return exp;
  }
}
