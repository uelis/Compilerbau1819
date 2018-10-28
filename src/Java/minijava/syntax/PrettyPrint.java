package minijava.syntax;

import java.util.List;

/** Einfacher (nicht effizienter) Prettyprinter, der MiniJava-AST-Werte als Java-Text ausgeben kann. */
public class PrettyPrint {

  private static final String indentStep = "  ";

  public static String prettyPrint(Program p) {
    return prettyPrintMain(p.mainClass, "") + "\n" +
            prettyPrintClassList(p.classes, "");
  }

  private static String prettyPrintClass(ClassDeclaration c, String indent) {
    return indent + "class " + c.getClassName() +
            (c.getSuperName() == null ? " " : " extends " + c.getSuperName() + " ") + "{\n\n" +
            prettyPrintVarList(c.getFields(), indent + indentStep) +
            prettyPrintMethList(c.getMethods(), indent + indentStep) +
            indent + "}\n";
  }

  private static String prettyPrintClassList(List<ClassDeclaration> cl, String indent) {
    StringBuilder classes = new StringBuilder();
    String sep = "";
    for (ClassDeclaration d : cl) {
      classes.append(sep);
      classes.append(prettyPrintClass(d, indent));
      sep = "\n";
    }
    return classes.toString();
  }

  private static String prettyPrintMeth(MethodDeclaration m, String indent) {
    StringBuilder params = new StringBuilder();
    String sep = "";
    for (Parameter p : m.getParameters()) {
      params.append(sep).append(p.getType().accept(new PrettyPrintVisitorType())).append(" ").append(p.getId());
      sep = ", ";
    }

    return indent + "public " +
            m.getReturnType().accept(new PrettyPrintVisitorType()) + " " + m.getMethodName() +
            " (" + params + ")" +
            prettyPrintThrows(m.throwsIOException()) +
            " {\n" +
            prettyPrintVarList(m.getLocalVars(), indent + indentStep) +
            m.getBody().accept(new PrettyPrintVisitorStm(indent + indentStep)) +
            indent + indentStep +
            "return " + m.getReturnExp().accept(new PrettyPrintVisitorExp()) + ";\n" +
            indent + "}\n";
  }

  private static String prettyPrintMethList(List<MethodDeclaration> dm, String indent) {
    StringBuilder meths = new StringBuilder();
    for (MethodDeclaration m : dm) {
      meths.append("\n");
      meths.append(prettyPrintMeth(m, indent));
    }
    return meths.toString();
  }

  private static String prettyPrintVar(VariableDeclaration d, String indent) {
    return indent + d.getType().accept(new PrettyPrintVisitorType()) + " " +
            d.getName() + ";";
  }

  private static String prettyPrintVarList(List<VariableDeclaration> dl, String indent) {
    StringBuilder decls = new StringBuilder();
    for (VariableDeclaration d : dl) {
      decls.append(prettyPrintVar(d, indent));
      decls.append("\n");
    }
    return decls.toString();
  }

  private static String prettyPrintMain(MainClassDeclaration d, String indent) {
    return indent + "class " + d.getClassName() + " {\n" +
            indent + indentStep + "public static void main (String[] " +
            d.getMainArg() + ")" +
            prettyPrintThrows(d.throwsIOException()) +
            " {\n" +
            d.getMainBody().accept(new PrettyPrintVisitorStm(indent + indentStep + indentStep)) +
            indent + indentStep + "}\n" +
            indent + "}\n";
  }

  private static String prettyPrintThrows(boolean throwsIOException) {
    if (throwsIOException) {
      return " throws java.io.IOException";
    } else {
      return "";
    }
  }

  static class PrettyPrintVisitorType implements TypeVisitor<String> {

    @Override
    public String visit(TypeVoid x) {
      return "void";
    }

    @Override
    public String visit(TypeBoolean x) {
      return "boolean";
    }

    @Override
    public String visit(TypeInt x) {
      return "int";
    }

    @Override
    public String visit(TypeClass x) {
      return x.getName();
    }

    @Override
    public String visit(TypeArray x) {
      return x.getEntryType().accept(this) + "[]";
    }
  }

  static class PrettyPrintVisitorExp implements ExpVisitor<String, RuntimeException> {

    @Override
    public String visit(ExpTrue x) {
      return "true";
    }

    @Override
    public String visit(ExpFalse x) {
      return "false";
    }

    @Override
    public String visit(ExpThis x) {
      return "this";
    }

    @Override
    public String visit(ExpNewIntArray x) {
      return "new int [" + x.getSize().accept(this) + "]";
    }

    @Override
    public String visit(ExpNew x) {
      return "new " + x.getClassName() + "()";
    }

    @Override
    public String visit(ExpBinOp e) {
      return "(" + e.getLeft().accept(this) + e.getOp().toString() + e.getRight().accept(this) + ")";
    }

    @Override
    public String visit(ExpArrayGet e) {
      return e.getArray().accept(this) + "[" + e.getIndex().accept(this) + "]";
    }

    @Override
    public String visit(ExpArrayLength e) {
      return e.getArray().accept(this) + ".length";
    }

    @Override
    public String visit(ExpInvoke e) {
      StringBuilder args = new StringBuilder();
      String sep = "";
      for (Exp ea : e.getArgs()) {
        args.append(sep).append(ea.accept(new PrettyPrintVisitorExp()));
        sep = ", ";
      }

      return e.getObj().accept(this) + "." + e.getMethod() + "(" + args + ")";
    }

    @Override
    public String visit(ExpRead e) {
      return "System.in.read()";
    }

    @Override
    public String visit(ExpIntConst x) {
      return Integer.valueOf(x.getValue()).toString();
    }

    @Override
    public String visit(ExpId x) {
      return x.getId();
    }

    @Override
    public String visit(ExpNeg x) {
      return "!(" + x.getExp().accept(this) + ")";
    }
  }

  static class PrettyPrintVisitorStm implements StmVisitor<String, RuntimeException> {

    final String indent;

    public PrettyPrintVisitorStm() {
      this.indent = "";
    }

    public PrettyPrintVisitorStm(String indent) {
      this.indent = indent;
    }

    @Override
    public String visit(StmSeq slist) {
      StringBuilder str = new StringBuilder();
      for (Stm s : slist.getStmList()) {
        str.append(s.accept(new PrettyPrintVisitorStm(indent)));
      }
      return str.toString();
    }

    @Override
    public String visit(StmIf s) {
      return indent + "if (" + s.getCond().accept(new PrettyPrintVisitorExp()) + ") {\n" +
              s.getTrueBranch().accept(new PrettyPrintVisitorStm(this.indent + indentStep)) +
              indent + "} else {\n" +
              s.getFalseBranch().accept(new PrettyPrintVisitorStm(this.indent + indentStep)) +
              indent + "}\n";
    }

    @Override
    public String visit(StmWhile s) {

      return indent + "while (" +
              s.getCond().accept(new PrettyPrintVisitorExp()) + ") {\n" +
              s.getBody().accept(new PrettyPrintVisitorStm(this.indent + " "))  +
              indent + "}\n";
    }

    @Override
    public String visit(StmPrintln s) {
      return indent + "System.out.println(" +
              s.getArg().accept(new PrettyPrintVisitorExp()) + ");\n";
    }

    @Override
    public String visit(StmWrite s) {
      return indent + "System.out.write(" +
              s.getExp().accept(new PrettyPrintVisitorExp()) + ");\n";
    }

    @Override
    public String visit(StmAssign s) {
      return indent + s.getId() + " = " +
              s.getExp().accept(new PrettyPrintVisitorExp()) + ";\n";
    }

    @Override
    public String visit(StmArrayAssign s) {
      return indent + s.getId() +
              "[" + s.getIndexExp().accept(new PrettyPrintVisitorExp()) + "] = " +
              s.getExp().accept(new PrettyPrintVisitorExp()) + ";\n";
    }
  }
}
