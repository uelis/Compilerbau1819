package minijava.syntax;

/**
 * Represents {@code array.length}.
 */
public class ExpArrayLength extends Exp {

  private final Exp array;

  public ExpArrayLength(Exp body) {
    this.array = body;
  }

  public Exp getArray() {
    return array;
  }

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T{
    return v.visit(this);
  }
}
