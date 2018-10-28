package minijava.syntax;

import java.util.Collections;
import java.util.List;

/**
 * Represents a method call {@code obj.method(args)}.
 */
public class ExpInvoke extends Exp {

  private final Exp obj;
  private final String method;
  private final List<Exp> args;

  public ExpInvoke(Exp obj, String method, List<Exp> args) {
    this.obj = obj;
    this.method = method;
    this.args = args;
  }

  @Override
  public <A, T extends Throwable> A accept(ExpVisitor<A, T> v) throws T{
    return v.visit(this);
  }

  public Exp getObj() {
    return obj;
  }

  public String getMethod() {
    return method;
  }

  public List<Exp> getArgs() {
    return Collections.unmodifiableList(args);
  }
}
