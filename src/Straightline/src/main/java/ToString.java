public class ToString {

  public static class StmVisitor implements Stm.Visitor<String> {

    public String visit(Stm.CompoundStm s) {
      return s.stm1.accept(this) + "; " + s.stm2.accept(this);
    }

    public String visit(Stm.AssignStm s) {
      return s.id + " = " + s.exp.accept(new ExpVisitor());
    }

    public String visit(Stm.PrintStm s) {
      StringBuffer buf = new StringBuffer();
      buf.append("print (");
      String sep = "";
      for (Exp e : s.exps) {
        buf.append(sep);
        buf.append(e.accept(new ExpVisitor()));
        sep = ", ";
      }
      buf.append(")");
      return buf.toString();
    }
  }

  public static class ExpVisitor implements Exp.Visitor<String> {

    public String visit(Exp.IdExp e) {
      return e.id;
    }

    public String visit(Exp.NumExp e) {
      return new Integer(e.num).toString();
    }

    public String visit(Exp.OpExp e) {
      return "(" + e.left.accept(this) + ") " + e.op.toString() + " (" + e.right.accept(this) + ")";
    }

    public String visit(Exp.EseqExp e) {
      return "(" + e.stm.accept(new StmVisitor()) + ", " +
        e.exp.accept(this) + ")";
    }
  }
}
