package minijava.intermediate.canon;

import minijava.intermediate.tree.*;

import java.util.LinkedList;
import java.util.List;

/**
 * Visitor class for canonizing a single statement.
 */
class CanonStm implements TreeStmVisitor<List<TreeStm>> {

  private List<TreeStm> canon(TreeStm s) {
    return s.accept(this);
  }

  // canonize expression e, without removing top-level call
  private CanonizedExp canon(TreeExp e) {
    return e.accept(new CanonExp());
  }

  // canonize expression e, removing top-level call
  private CanonizedExp canonNoTopCALL(TreeExp e) {
    CanonExp ce = new CanonExp();
    return ce.canonNoTopCALL(e);
  }

  @Override
  public List<TreeStm> visit(TreeStmMove stmMOVE) {
    if (stmMOVE.getDst() instanceof TreeExpMem) {
      TreeExp addr = ((TreeExpMem) stmMOVE.getDst()).getAddress();
      return CanonizedExp.toStm(
              canonNoTopCALL(addr),
              canonNoTopCALL(stmMOVE.getSrc()),
              (eaddr, esrc) -> new TreeStmMove(new TreeExpMem(eaddr), esrc));
    } else if (stmMOVE.getDst() instanceof TreeExpTemp) {
      return canon(stmMOVE.getSrc()).toStm(esrc -> new TreeStmMove(stmMOVE.getDst(), esrc));
    } else if (stmMOVE.getDst() instanceof TreeExpParam) {
      return canon(stmMOVE.getSrc()).toStm(esrc -> new TreeStmMove(stmMOVE.getDst(), esrc));
    } else if (stmMOVE.getDst() instanceof TreeExpESeq) {
      TreeExpESeq dst = (TreeExpESeq) stmMOVE.getDst();
      return new TreeStmSeq(dst.getStm(), new TreeStmMove(dst.getExp(), stmMOVE.getSrc())).accept(this);
    } else {
      throw new Error("Left-hand side of MOVE must be TEMP, PARAM, MEM or ESEQ.");
    }
  }

  @Override
  public List<TreeStm> visit(TreeStmJump stmJUMP) {
    return canonNoTopCALL(stmJUMP.getDst()).toStm(e -> new TreeStmJump(e, stmJUMP.getPossibleTargets()));
  }

  @Override
  public List<TreeStm> visit(TreeStmCJump stmCJUMP) {
    return CanonizedExp.toStm(
            canonNoTopCALL(stmCJUMP.getLeft()),
            canonNoTopCALL(stmCJUMP.getRight()),
            (l, r) -> new TreeStmCJump(stmCJUMP.getRel(), l, r, stmCJUMP.getLabelTrue(), stmCJUMP.getLabelFalse())
    );
  }

  @Override
  public List<TreeStm> visit(TreeStmSeq stmSEQ) {
    List<TreeStm> cstms = new LinkedList<>();
    for (TreeStm s: stmSEQ.getStms()) {
      cstms.addAll(canon(s));
    }
    return cstms;
  }

  @Override
  public List<TreeStm> visit(TreeStmLabel stmLABEL) {
    List<TreeStm> stms = new LinkedList<>();
    stms.add(stmLABEL);
    return stms;
  }
}
