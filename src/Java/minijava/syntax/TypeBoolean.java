package minijava.syntax;

/**
 * Represents the type {@code boolean}.
 */
public class TypeBoolean extends Type {

  @Override
  public String toString() {
    return "boolean";
  }

  @Override
  public boolean equals(Object obj) {
    return (obj instanceof TypeBoolean);
  }

  @Override
  public <A> A accept(TypeVisitor<A> v) {
    return v.visit(this);
  }

  @Override
  public int hashCode() {
    return 7;
  }
}
