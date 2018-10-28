package minijava.syntax;

public abstract class Type {

  @Override
  public abstract String toString();

  public abstract <A> A accept(TypeVisitor<A> v);
}




