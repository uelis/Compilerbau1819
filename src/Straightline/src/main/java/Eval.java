public class Eval {

  public static class EvalStm implements Stm.Visitor<Void> {

    public Void visit(Stm.CompoundStm s) {
      throw new UnsupportedOperationException("Not implemented!");
    }

    public Void visit(Stm.AssignStm s) {
      throw new UnsupportedOperationException("Not implemented!");
    }

    public Void visit(Stm.PrintStm s) {
      throw new UnsupportedOperationException("Not implemented!");
    }
  }

  public static class EvalExp implements Exp.Visitor<Integer> {

    public Integer visit(Exp.IdExp e) {
      throw new UnsupportedOperationException("Not implemented!");
    }

    public Integer visit(Exp.NumExp e) {
      throw new UnsupportedOperationException("Not implemented!");
    }

    public Integer visit(Exp.OpExp e) {
      throw new UnsupportedOperationException("Not implemented!");
    }

    public Integer visit(Exp.EseqExp e) {
      throw new UnsupportedOperationException("Not implemented!");
    }
  }
}
