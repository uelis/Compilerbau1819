package minijava.intermediate.tree;

public interface TreeStmVisitor<A> {

  A visit(TreeStmMove stmMOVE);

  A visit(TreeStmJump stmJUMP);

  A visit(TreeStmCJump stmCJUMP);

  A visit(TreeStmSeq stmSEQ);

  A visit(TreeStmLabel stmLABEL);
}
