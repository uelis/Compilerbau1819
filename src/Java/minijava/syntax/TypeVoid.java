package minijava.syntax;

/**
 * Represents the type {@code void}.
 */
public class TypeVoid extends Type {

  @Override
  public String toString() {
    return "boolean";
  }

  @Override
  public <A> A accept(TypeVisitor<A> v) {
    return v.visit(this);
  }

  @Override
  public boolean equals(Object obj) {
    return (obj instanceof TypeVoid);
  }

  @Override
  public int hashCode() {
    return 7;
  }
}
