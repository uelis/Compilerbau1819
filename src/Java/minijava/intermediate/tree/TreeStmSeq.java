package minijava.intermediate.tree;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class TreeStmSeq extends TreeStm {

  private final List<TreeStm> stms;

  public TreeStmSeq(List<TreeStm> stms) {
    if (stms == null) {
      throw new NullPointerException();
    }
    this.stms = stms;
  }

  public TreeStmSeq(TreeStm... stms) {
    this(Arrays.asList(stms));
  }

  public List<TreeStm> getStms() {
    return stms;
  }

  @Override
  public <A> A accept(TreeStmVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    StringBuilder buf = new StringBuilder();
    buf.append("SEQ(");
    Iterator<TreeStm> it = getStms().iterator();
    while (it.hasNext()) {
      TreeStm s = it.next();
      buf.append(s);
      if (it.hasNext()) buf.append(", ");
    }
    buf.append(") ");
    return buf.toString();
  }
}
