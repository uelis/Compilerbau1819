package minijava.syntax;

import java.util.Collections;
import java.util.List;

/**
 * Represents a sequential composition {@code s1; s2; ...; sn }.
 */
public class StmSeq extends Stm {

  private final List<Stm> stmList;

  public StmSeq(List<Stm> stmList) {
    this.stmList = stmList;
  }

  @Override
  public <A, T extends Throwable> A accept(StmVisitor<A, T> v) throws T {
    return v.visit(this);
  }

  public List<Stm> getStmList() {
    return Collections.unmodifiableList(stmList);
  }
}

