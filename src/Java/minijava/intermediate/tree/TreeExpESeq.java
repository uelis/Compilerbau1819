package minijava.intermediate.tree;

public class TreeExpESeq extends TreeExp {
  private final TreeStm stm;
  private final TreeExp exp;

  public TreeExpESeq(TreeStm stm, TreeExp exp) {
    if (stm == null || exp == null) {
      throw new NullPointerException();
    }
    this.stm = stm;
    this.exp = exp;
  }

  public TreeStm getStm() {
    return stm;
  }

  public TreeExp getExp() {
    return exp;
  }

  @Override
  public <A> A accept(TreeExpVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    return "ESEQ(" + getStm() + ", " + getExp() + ")";
  }


}
