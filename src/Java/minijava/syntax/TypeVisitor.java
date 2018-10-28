package minijava.syntax;

public interface TypeVisitor<A> {

  A visit(TypeVoid t);

  A visit(TypeBoolean t);

  A visit(TypeInt t);

  A visit(TypeClass t);

  A visit(TypeArray t);
}
