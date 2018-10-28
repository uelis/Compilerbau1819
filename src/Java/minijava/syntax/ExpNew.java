package minijava.syntax;

/**
 * Represents {@code new ClassName}.
 */
public class ExpNew extends Exp {

  private final String className;

  public ExpNew(String className) {
    this.className = className;
  }

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T {
    return v.visit(this);
  }

  public String getClassName() {
    return className;
  }
}
