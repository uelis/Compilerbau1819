package minijava.syntax;

/**
 * Represents the class type {@code Name}.
 */
public class TypeClass extends Type {

  private final String name;

  public TypeClass(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }

  @Override
  public String toString() {
    return getName();
  }

  @Override
  public <A> A accept(TypeVisitor<A> v) {
    return v.visit(this);
  }

  @Override
  public boolean equals(Object obj) {
    return (obj instanceof TypeClass && getName().equals(((TypeClass) obj).getName()));
  }

  @Override
  public int hashCode() {
    int hash = 7;
    hash = 29 * hash + (this.getName() != null ? this.getName().hashCode() : 0);
    return hash;
  }

}
