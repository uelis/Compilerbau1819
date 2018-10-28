package minijava.syntax;

/**
 * Represents {@code id[index] = exp;}.
 */
public class StmArrayAssign extends Stm {

  private final String id;
  private final Exp index;
  private final Exp exp;

  public StmArrayAssign(String id, Exp index, Exp exp) {
    this.id = id;
    this.index = index;
    this.exp = exp;
  }

  @Override
  public <A, T extends Throwable> A accept(StmVisitor<A, T> v) throws T {
    return v.visit(this);
  }

  public String getId() {
    return id;
  }

  public Exp getIndexExp() {
    return index;
  }

  public Exp getExp() {
    return exp;
  }
}
