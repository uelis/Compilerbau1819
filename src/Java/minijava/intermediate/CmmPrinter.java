package minijava.intermediate;

import minijava.intermediate.tree.*;

import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

public class CmmPrinter {

  private StringBuilder declarations;
  private StringBuilder code;
  private int codeIndent;

  public String prgToCmm(TreePrg prg) {
    declarations = new StringBuilder();
    code = new StringBuilder();
    codeIndent = 0;

    declarations.append("#include <stdint.h>\n");
    declarations.append("#define MEM(x) *((int32_t*)(x))\n\n");
    declarations.append("int32_t L_halloc(int32_t size);\n");
    declarations.append("int32_t L_println_int(int32_t n);\n");
    declarations.append("int32_t L_write(int32_t n);\n");
    declarations.append("int32_t L_read();\n");
    declarations.append("int32_t L_raise(int32_t rc);\n");

    for (TreeFunction m : prg) {
      methodToCmm(m);
    }

    return declarations.toString() + "\n\n" + code.toString();
  }

  private void methodToCmm(TreeFunction method) {

    // function prototype
    StringBuilder prototype = new StringBuilder();
    prototype.append("int32_t ").append(method.getName()).append("(");
    String sep = "";
    for (int i = 0; i < method.getNumberOfParameters(); i++) {
      prototype.append(sep).append("int32_t param").append(i);
      sep = ", ";
    }
    prototype.append(")");

    declarations.append(prototype);
    declarations.append(";\n");

    code.append(prototype);
    code.append(" {\n");
    codeIndent++;

    // declare locals
    Set<Temp> temps = new TreeSet<>();
    TempsInTreeStm tempsv = new TempsInTreeStm();
    for (TreeStm stm : method) {
      temps.addAll(stm.accept(tempsv));
    }
    if (temps.size() > 0) {
      StringBuilder decls = new StringBuilder();
      sep = "";
      for (Temp t : temps) {
        decls.append(sep);
        decls.append(t);
        sep = ", ";
      }
      emit("int32_t " + decls + ";");
    }

    // function body
    TreeStmToCmm tv = new TreeStmToCmm();
    for (TreeStm stm : method) {
      emit("/* " + stm.toString() + " */");
      stm.accept(tv);
    }

    // return
    emit("return " + method.getReturnTemp() + ";");
    codeIndent--;
    emit("}");
    code.append("\n");
  }

  private void emit(String s) {
    for (int i = 0; i < codeIndent; i++) {
      code.append("  ");
    }
    code.append(s);
    code.append("\n");
  }

  private Temp emitVarDecl(String v) {
    Temp t = new Temp();
    emit("int32_t " + t + " = " + v + ";");
    return t;
  }

  private class TreeExpToCmm implements TreeExpVisitor<String> {

    private String gen(TreeExp e) {
      return e.accept(this);
    }

    private String genVarDecl(TreeExp e) {
      String v = e.accept(this);
      if (e instanceof TreeExpConst || e instanceof TreeExpName) {
        return v;
      } else {
        return emitVarDecl(v).toString();
      }
    }

    private void gen(TreeStm s) {
      s.accept(new TreeStmToCmm());
    }

    @Override
    public String visit(TreeExpConst expCONST) {
      return "" + expCONST.getValue();
    }

    @Override
    public String visit(TreeExpName expNAME) {
      return "(int32_t)" + expNAME.getLabel().toString();
    }

    @Override
    public String visit(TreeExpTemp expTEMP) {
      return expTEMP.getTemp().toString();
    }

    @Override

    public String visit(TreeExpParam expPARAM) {
      return "param" + expPARAM.getNumber();
    }

    @Override
    public String visit(TreeExpMem expMEM) {
      return "MEM(" + gen(expMEM.getAddress()) + ")";
    }

    private String printOperator(TreeExpBinOp.Op op) {
      switch (op) {
        case PLUS:
          return "+";
        case MINUS:
          return "-";
        case MUL:
          return "*";
        case DIV:
          return "/";
        case AND:
          return "&";
        case OR:
          return "|";
        case LSHIFT:
          return "<<";
        case RSHIFT:
          return ">>";
        case XOR:
          return "^";
      }
      throw new UnsupportedOperationException("Operator " + op + " not supported in C--");
    }

    @Override
    public String visit(TreeExpBinOp expOP) {
      // C doesn't specify the evaluation ordering within expressions,
      // so we have to sequence possibly effectful expressions explicitly.
      String left = genVarDecl(expOP.getLeft());
      String right = genVarDecl(expOP.getRight());
      return "(" + left + " " + printOperator(expOP.getOp()) + " " + right + ")";
    }

    @Override
    public String visit(TreeExpCall expCALL) {
      StringBuilder call = new StringBuilder();
      StringBuilder argTypes = new StringBuilder();
      String sep = "";
      for (TreeExp arg : expCALL.getArguments()) {
        call.append(sep);
        call.append(genVarDecl(arg));
        argTypes.append(sep);
        argTypes.append("int32_t");
        sep = ", ";
      }
      Temp r;
      if (expCALL.getFunction() instanceof TreeExpName) {
        r = emitVarDecl(((TreeExpName) expCALL.getFunction()).getLabel() + "(" + call + ")");
      } else {
        r = emitVarDecl("((int32_t (*) (" + argTypes + "))(" + gen(expCALL.getFunction()) + "))(" + call + ")");
      }
      return r.toString();
    }

    @Override
    public String visit(TreeExpESeq expESEQ) {
      gen(expESEQ.getStm());
      return gen(expESEQ.getExp());
    }
  }

  private class TreeStmToCmm implements TreeStmVisitor<Void> {

    private String gen(TreeExp e) {
      return e.accept(new TreeExpToCmm());
    }

    private String genVarDecl(TreeExp e) {
      String v = e.accept(new TreeExpToCmm());
      if (e instanceof TreeExpConst || e instanceof TreeExpName) {
        return v;
      } else {
        return emitVarDecl(v).toString();
      }
    }

    private void gen(TreeStm s) {
      s.accept(this);
    }

    @Override
    public Void visit(TreeStmMove stmMOVE) {
      if (stmMOVE.getDst() instanceof TreeExpTemp) {
        TreeExpTemp dst = (TreeExpTemp) stmMOVE.getDst();
        String src = gen(stmMOVE.getSrc());
        emit(dst.getTemp() + " = " + src + ";");
      } else if (stmMOVE.getDst() instanceof TreeExpParam) {
        TreeExpParam dst = (TreeExpParam) stmMOVE.getDst();
        String src = gen(stmMOVE.getSrc());
        emit("param" + dst.getNumber() + " = " + src + ";");
      } else if (stmMOVE.getDst() instanceof TreeExpMem) {
        TreeExpMem dst = (TreeExpMem) stmMOVE.getDst();
        String a = genVarDecl(dst.getAddress());
        String src = gen(stmMOVE.getSrc());
        emit("MEM(" + a + ")" + " = " + src + ";");
      } else if (stmMOVE.getDst() instanceof TreeExpESeq) {
        TreeExpESeq dst = (TreeExpESeq) stmMOVE.getDst();
        new TreeStmSeq(dst.getStm(), new TreeStmMove(dst.getExp(), stmMOVE.getSrc())).accept(this);
      } else {
        throw new UnsupportedOperationException("Left-hand side of MOVE must be TEMP, PARAM, MEM or ESEQ!");
      }
      return null;
    }

    @Override
    public Void visit(TreeStmJump stmJUMP) {
      if (stmJUMP.getDst() instanceof TreeExpName) {
        emit("goto " + ((TreeExpName) stmJUMP.getDst()).getLabel() + ";");
      } else {
        throw new UnsupportedOperationException("Only calls to labels are implemented!");
      }
      return null;
    }

    private String printRelation(TreeStmCJump.Rel rel) {
      switch (rel) {
        case EQ:
          return "==";
        case NE:
          return "!=";
        case LT:
          return "<";
        case GT:
          return ">";
        case LE:
          return "<=";
        case GE:
          return ">=";
      }
      throw new UnsupportedOperationException("CJUMP relation " + rel + " not supported in C--");
    }

    @Override
    public Void visit(TreeStmCJump stmCJUMP) {
      // C doesn't specify the evaluation ordering within expressions,
      // so we have to sequence possibly effectful expressions explicitly.
      String left = genVarDecl(stmCJUMP.getLeft());
      String right = genVarDecl(stmCJUMP.getRight());

      emit("if ("
              + left + " "
              + printRelation(stmCJUMP.getRel()) + " "
              + right + ") "
              + "goto " + stmCJUMP.getLabelTrue()
              + "; else goto " + stmCJUMP.getLabelFalse() + ";");
      return null;
    }

    @Override
    public Void visit(TreeStmSeq stmSEQ) {
      for (TreeStm s: stmSEQ.getStms()) {
        gen(s);
      }
      return null;
    }

    @Override
    public Void visit(TreeStmLabel stmLABEL) {
      codeIndent--;
      emit(stmLABEL.getLabel().toString() + ": ;");
      codeIndent++;
      return null;
    }
  }

  static class TempsInTreeExp implements TreeExpVisitor<Set<Temp>> {

    private Set<Temp> temps(TreeExp e) {
      return e.accept(this);
    }

    private Set<Temp> temps(TreeStm s) {
      return s.accept(new TempsInTreeStm());
    }

    @Override
    public Set<Temp> visit(TreeExpConst expCONST) {
      return new TreeSet<>();
    }

    @Override
    public Set<Temp> visit(TreeExpName expNAME) {
      return new TreeSet<>();
    }

    @Override
    public Set<Temp> visit(TreeExpTemp expTEMP) {
      Set<Temp> s = new TreeSet<>();
      s.add(expTEMP.getTemp());
      return s;
    }

    @Override
    public Set<Temp> visit(TreeExpParam expPARAM) {
      return new TreeSet<>();
    }

    @Override
    public Set<Temp> visit(TreeExpMem expMEM) {
      return temps(expMEM.getAddress());
    }

    @Override
    public Set<Temp> visit(TreeExpBinOp expOP) {
      Set<Temp> s = temps(expOP.getLeft());
      s.addAll(temps(expOP.getRight()));
      return s;
    }

    @Override
    public Set<Temp> visit(TreeExpCall expCALL) {
      Set<Temp> s = new TreeSet<>();
      for (TreeExp arg : expCALL.getArguments()) {
        s.addAll(temps(arg));
      }
      return s;
    }

    @Override
    public Set<Temp> visit(TreeExpESeq expESEQ) {
      Set<Temp> s = temps(expESEQ.getStm());
      s.addAll(temps(expESEQ.getExp()));
      return s;
    }
  }

  static class TempsInTreeStm implements TreeStmVisitor<Set<Temp>> {

    private Set<Temp> temps(TreeExp e) {
      return e.accept(new TempsInTreeExp());
    }

    private Set<Temp> temps(TreeStm s) {
      return s.accept(this);
    }

    @Override
    public Set<Temp> visit(TreeStmMove stmMOVE) {
      Set<Temp> s = temps(stmMOVE.getDst());
      s.addAll(temps(stmMOVE.getSrc()));
      return s;
    }

    @Override
    public Set<Temp> visit(TreeStmJump stmJUMP) {
      return temps(stmJUMP.getDst());
    }

    @Override
    public Set<Temp> visit(TreeStmCJump stmCJUMP) {
      Set<Temp> s = temps(stmCJUMP.getLeft());
      s.addAll(temps(stmCJUMP.getRight()));
      return s;
    }

    @Override
    public Set<Temp> visit(TreeStmSeq stmSEQ) {
      Set<Temp> ts = new HashSet<>();
      for (TreeStm s: stmSEQ.getStms()) {
        ts.addAll(temps(s));
      }
      return ts;
    }

    @Override
    public Set<Temp> visit(TreeStmLabel stmLABEL) {
      return new TreeSet<>();
    }
  }
}
