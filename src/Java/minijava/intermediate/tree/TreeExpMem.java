package minijava.intermediate.tree;

public class TreeExpMem extends TreeExp {
  private final TreeExp address;

  public TreeExpMem(TreeExp address) {
    if (address == null) {
      throw new NullPointerException();
    }
    this.address = address;
  }

  public TreeExp getAddress() {
    return address;
  }

  @Override
  public <A> A accept(TreeExpVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    return "MEM(" + getAddress() + ")";
  }


}
