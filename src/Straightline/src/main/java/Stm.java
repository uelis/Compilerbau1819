import java.util.List;

public abstract class Stm {

  public abstract <A> A accept(Visitor<A> v);

  public final static class CompoundStm extends Stm {

    public final Stm stm1;
    public final Stm stm2;

    public CompoundStm(Stm stm1, Stm stm2) {
      this.stm1 = stm1;
      this.stm2 = stm2;
    }

    public <A> A accept(Visitor<A> v) {
      return v.visit(this);
    }
  }

  public final static class AssignStm extends Stm {

    public final String id;
    public final Exp exp;

    public AssignStm(String id, Exp exp) {
      this.id = id;
      this.exp = exp;
    }

    public <A> A accept(Visitor<A> v) {
      return v.visit(this);
    }
  }

  public final static class PrintStm extends Stm {

    public final List<Exp> exps;

    public PrintStm(List<Exp> exps) {
      this.exps = exps;
    }

    public <A> A accept(Visitor<A> v) {
      return v.visit(this);
    }
  }

  public interface Visitor<A> {

    public A visit(CompoundStm s);

    public A visit(AssignStm s);

    public A visit(PrintStm s);
  }
}
