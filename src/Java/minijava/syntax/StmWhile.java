package minijava.syntax;

/**
 * Represents {@code while (cond) body;}.
 */
public class StmWhile extends Stm {

  private final Exp cond;
  private final Stm body;

  public StmWhile(Exp cond, Stm body) {
    this.cond = cond;
    this.body = body;
  }

  @Override
  public <A, T extends Throwable> A accept(StmVisitor<A, T> v) throws T {
    return v.visit(this);
  }

  public Exp getCond() {
    return cond;
  }

  public Stm getBody() {
    return body;
  }
}

