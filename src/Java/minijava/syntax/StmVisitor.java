package minijava.syntax;

public interface StmVisitor<A, T extends Throwable> {

  A visit(StmSeq s) throws T;

  A visit(StmIf s) throws T;

  A visit(StmWhile s) throws T;

  A visit(StmPrintln s) throws T;

  A visit(StmWrite s) throws T;

  A visit(StmAssign s) throws T;

  A visit(StmArrayAssign s) throws T;
}
