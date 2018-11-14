package minijava.intermediate.tree;

import minijava.intermediate.Temp;

public class TreeExpTemp extends TreeExp {
  private final Temp temp;

  public TreeExpTemp(Temp temp) {
    if (temp == null) {
      throw new NullPointerException();
    }
    this.temp = temp;
  }

  public Temp getTemp() {
    return temp;
  }

  @Override
  public <A> A accept(TreeExpVisitor<A> visitor) {
    return visitor.visit(this);
  }

  @Override
  public String toString() {
    return "TEMP(" + getTemp() + ")";
  }

}
