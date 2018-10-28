package minijava.syntax;

/**
 * Represents a variable {@code id}.
 */
public class ExpId extends Exp {

  private final String id;

  public ExpId(String id) {
    this.id = id;
  }

  public String getId() {
    return id;
  }

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T{
    return v.visit(this);
  }
}
