package minijava.syntax;

/**
 * Represents {@code id = exp;}.
 */
public class StmAssign extends Stm {

  private final String id;
  private final Exp exp;

  public StmAssign(String id, Exp exp) {
    this.id = id;
    this.exp = exp;
  }

  @Override
  public <A, T extends Throwable> A accept(StmVisitor<A, T> v) throws T {
    return v.visit(this);
  }

  public String getId() {
    return id;
  }

  public Exp getExp() {
    return exp;
  }
}
