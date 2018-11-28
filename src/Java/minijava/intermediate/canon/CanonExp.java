package minijava.intermediate.canon;

import minijava.intermediate.Temp;
import minijava.intermediate.tree.*;

import java.util.LinkedList;
import java.util.List;

/**
 * Visitor class to canonize tree expressions.
 * <p>
 *   Returns a canonized expression whose tree-exp-part
 *   that may contain a single CALL at the top. All other
 *   calls are moved to statements.
 * </p>
 */
class CanonExp implements TreeExpVisitor<CanonizedExp> {

  /**
   * Method to canonize an expression into one that does not
   * contain any calls in the expression (only in the statements).
   */
  CanonizedExp canonNoTopCALL(TreeExp e) {

    CanonizedExp ce = e.accept(this);
    if (ce.getExp() instanceof TreeExpCall) {
      TreeExp call = ce.getExp();
      TreeExp t = new TreeExpTemp(new Temp());
      List<TreeStm> stms = new LinkedList<>(ce.getBody());
      stms.add(new TreeStmMove(t, call));
      ce = new CanonizedExp(stms, t);
    }
    return ce;
  }

  @Override
  public CanonizedExp visit(TreeExpConst expCONST) {
    return new CanonizedExp(expCONST);
  }

  @Override
  public CanonizedExp visit(TreeExpName expNAME) {
    return new CanonizedExp(expNAME);
  }

  @Override
  public CanonizedExp visit(TreeExpTemp expTEMP) {
    return new CanonizedExp(expTEMP);
  }

  @Override
  public CanonizedExp visit(TreeExpParam expPARAM) {
    return new CanonizedExp(expPARAM);
  }

  @Override
  public CanonizedExp visit(TreeExpMem expMEM) {
    return canonNoTopCALL(expMEM.getAddress()).mapExp(TreeExpMem::new);
  }

  @Override
  public CanonizedExp visit(TreeExpBinOp expOP) {
    return CanonizedExp.combine(
            canonNoTopCALL(expOP.getLeft()),
            canonNoTopCALL(expOP.getRight()),
            (l, r) -> new TreeExpBinOp(expOP.getOp(), l, r));
  }

  @Override
  public CanonizedExp visit(TreeExpCall expCALL) {
    CanonizedExp cfunc = canonNoTopCALL(expCALL.getFunction());

    List<CanonizedExp> cargs = new LinkedList<>();
    for (TreeExp arg : expCALL.getArguments()) {
      cargs.add(canonNoTopCALL(arg));
    }

    return CanonizedExp.combine(cfunc, cargs, TreeExpCall::new);
  }

  @Override
  public CanonizedExp visit(TreeExpESeq expESEQ) {
    CanonizedExp b1 = new CanonizedExp(expESEQ.getStm().accept(new CanonStm()), new TreeExpConst(0));
    CanonizedExp cres = canonNoTopCALL(expESEQ.getExp());
    return CanonizedExp.combine(b1, cres, (nop, e) -> e);
  }
}
