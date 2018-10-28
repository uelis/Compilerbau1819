package minijava.syntax;

/**
 * Represents a constant number {@code value}.
 */
public class ExpIntConst extends Exp {

  private final int value;

  public ExpIntConst(int value) {
    this.value = value;
  }

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T{
    return v.visit(this);
  }

  public int getValue() {
    return value;
  }
}
