package minijava.syntax;

/**
 * Represents {@code System.out.write(exp);}.
 */
public class StmWrite extends Stm {

  private final Exp exp;

  public StmWrite(Exp exp) {
    this.exp = exp;
  }

  @Override
  public <A, T extends Throwable> A accept(StmVisitor<A, T> v) throws T {
    return v.visit(this);
  }

  public Exp getExp() {
    return exp;
  }
}
