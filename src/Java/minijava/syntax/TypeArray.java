package minijava.syntax;

/**
 * Represents an array type {@code type[]}.
 */
public class TypeArray extends Type {

  private final Type type;

  public TypeArray(Type type) {
    this.type = type;
  }

  @Override
  public String toString() {
    return getEntryType() + "[]";
  }

  @Override
  public <A> A accept(TypeVisitor<A> v) {
    return v.visit(this);
  }

  @Override
  public boolean equals(Object t) {
    return (t instanceof TypeArray && ((TypeArray) t).getEntryType().equals(getEntryType()));
  }

  @Override
  public int hashCode() {
    int hash = 5;
    hash = 97 * hash + (this.getEntryType() != null ? this.getEntryType().hashCode() : 0);
    return hash;
  }

  public Type getEntryType() {
    return type;
  }
}
