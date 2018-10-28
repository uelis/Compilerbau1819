package minijava.syntax;

/**
 * Represents the type {@code int}.
 */
public class TypeInt extends Type {

  @Override
  public String toString() {
    return "int";
  }

  @Override
  public <A> A accept(TypeVisitor<A> v) {
    return v.visit(this);
  }

  @Override
  public boolean equals(Object obj) {
    return (obj instanceof TypeInt);
  }

  @Override
  public int hashCode() {
    return 5;
  }
}
