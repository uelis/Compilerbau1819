package minijava.syntax;

/**
 * Represents {@code if (cond) trueBranch else falseBranch;}.
 */
public class StmIf extends Stm {

  private final Exp cond;
  private final Stm trueBranch;
  private final Stm falseBranch;

  public StmIf(Exp cond, Stm trueBranch, Stm falseBranch) {
    this.cond = cond;
    this.trueBranch = trueBranch;
    this.falseBranch = falseBranch;
  }

  @Override
  public <A, T extends Throwable> A accept(StmVisitor<A, T> v) throws T {
    return v.visit(this);
  }

  public Exp getCond() {
    return cond;
  }

  public Stm getTrueBranch() {
    return trueBranch;
  }

  public Stm getFalseBranch() {
    return falseBranch;
  }
}

