package minijava.intermediate.tree;

import minijava.intermediate.Label;

public class TreeStmCJump extends TreeStm {

  public enum Rel {

    EQ, NE, LT, GT, LE, GE, ULT, ULE, UGT, UGE;

    public Rel neg() {
      switch (this) {
        case EQ:
          return NE;
        case NE:
          return EQ;
        case LT:
          return GE;
        case GT:
          return LE;
        case LE:
          return GT;
        case GE:
          return LT;
        case ULT:
          return UGE;
        case UGT:
          return ULE;
        case ULE:
          return UGT;
        case UGE:
          return ULT;
        default:
          assert (false);
          return EQ;
      }
    }
  }

  private final Rel rel;
  private final TreeExp left;
  private final TreeExp right;
  private final Label labelTrue;
  private final Label labelFalse;

  public Rel getRel() {
    return rel;
  }

  public TreeExp getLeft() {
    return left;
  }

  public TreeExp getRight() {
    return right;
  }

  public Label getLabelTrue() {
    return labelTrue;
  }

  public Label getLabelFalse() {
    return labelFalse;
  }


  /**
   * Assumption: The jump is likely taken.
   */
  public TreeStmCJump(Rel rel, TreeExp left, TreeExp right, Label labelTrue, Label labelFalse) {
    if (rel == null || left == null || right == null || labelTrue == null || labelFalse == null) {
      throw new NullPointerException();
    }
    this.rel = rel;
    this.left = left;
    this.right = right;
    this.labelTrue = labelTrue;
    this.labelFalse = labelFalse;
  }

  public
  @Override
  <A> A accept(TreeStmVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    return "CJUMP(" + getRel() + ", " + getLeft() + ", " + getRight() +
            ", " + getLabelTrue() + ", " + getLabelFalse() + ")";
  }
}
