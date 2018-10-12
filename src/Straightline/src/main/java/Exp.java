
public abstract class Exp {

  public abstract <A> A accept(Visitor<A> v);

  public final static class IdExp extends Exp {

    public final String id;

    public IdExp(String id) {
      this.id = id;
    }

    public <A> A accept(Visitor<A> v) {
      return v.visit(this);
    }
  }

  public final static class NumExp extends Exp {

    public final int num;

    public NumExp(Integer num) {
      this.num = num;
    }

    public <A> A accept(Visitor<A> v) {
      return v.visit(this);
    }
  }

  public final static class OpExp extends Exp {

    public enum Binop {

      PLUS("+"), MINUS("-"), TIMES("*"), DIVIDE("/");
      private String name;

      private Binop(String name) {
        this.name = name;
      }

      @Override
      public String toString() {
        return name;
      }
    };
    public final Exp left;
    public final Binop op;
    public final Exp right;

    public OpExp(Exp left, Binop op, Exp right) {
      this.left = left;
      this.op = op;
      this.right = right;
    }

    public <A> A accept(Visitor<A> v) {
      return v.visit(this);
    }
  }

  public static class EseqExp extends Exp {

    public final Stm stm;
    public final Exp exp;

    public EseqExp(Stm stm, Exp exp) {
      this.stm = stm;
      this.exp = exp;
    }

    public <A> A accept(Visitor<A> v) {
      return v.visit(this);
    }
  }

  public interface Visitor<A> {

    public A visit(IdExp e);

    public A visit(NumExp e);

    public A visit(OpExp e);

    public A visit(EseqExp e);
  }
}
