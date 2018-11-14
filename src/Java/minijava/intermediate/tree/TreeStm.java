package minijava.intermediate.tree;

public abstract class TreeStm {

  public abstract <A> A accept(TreeStmVisitor<A> visitor);

  public static TreeStm getNOP() {
    return new TreeStmSeq();
  }
}
