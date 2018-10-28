package minijava.syntax;

/**
 * Represents {@code System.out.println(exp);}.
 */
public class StmPrintln extends Stm {

  private final Exp arg;

  public StmPrintln(Exp arg) {
    this.arg = arg;
  }

  @Override
  public <A, T extends Throwable> A accept(StmVisitor<A, T> v) throws T {
    return v.visit(this);
  }

  public Exp getArg() {
    return arg;
  }
}
