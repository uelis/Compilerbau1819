package minijava.syntax;

/**
 * Represents {@code array[index]}.
 */
public class ExpArrayGet extends Exp {

  private final Exp array;
  private final Exp index;

  public ExpArrayGet(Exp array, Exp index) {
    this.array = array;
    this.index = index;
  }

  public Exp getArray() {
    return array;
  }

  public Exp getIndex() {
    return index;
  }

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T {
    return v.visit(this);
  }
}
