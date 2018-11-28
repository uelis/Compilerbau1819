package minijava.intermediate.canon;

import minijava.intermediate.Temp;
import minijava.intermediate.tree.*;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.function.BiFunction;
import java.util.function.Function;

/**
 * Representation of a canonized expression
 * <p>
 * A canonised expression is a pair (s,e), where s is a list of canonized statements and e is an expression.
 * </p>
 */
final class CanonizedExp {

  private final List<TreeStm> body;
  private final TreeExp exp;

  CanonizedExp(TreeExp exp) {
    this.body = Collections.emptyList();
    this.exp = exp;
  }

  CanonizedExp(List<TreeStm> body, TreeExp exp) {
    this.body = body;
    this.exp = exp;
  }

  public List<TreeStm> getBody() {
    return body;
  }

  public TreeExp getExp() {
    return exp;
  }

  CanonizedExp mapExp(Function<TreeExp, TreeExp> f) {
    return new CanonizedExp(getBody(), f.apply(getExp()));
  }

  /**
   * Combine two canonised expressions (s1,e1) and (s2,e2) into one
   * using the function f.
   * <p>
   * One may think of the result as the pair
   * (s1; MOVE(TEMP(t), e1); s2, f(TEMP(t), e2)),
   * for a fresh temporary t.
   * However, in some cases it is not necessary to introduce a new temporary t,
   * e.g. if e1 is CONST(3). Such cases can be optimised here.
   * </p>
   */
  static CanonizedExp combine(CanonizedExp b1, CanonizedExp b2,
                              BiFunction<TreeExp, TreeExp, TreeExp> f) {
    CanonizedExp c = compose(b1, b2.getBody());
    return new CanonizedExp(c.getBody(), f.apply(c.getExp(), b2.getExp()));
  }

  /**
   * Iterated case of {@code combine}.
   */
  static CanonizedExp combine(CanonizedExp b1, List<CanonizedExp> clist,
                              BiFunction<TreeExp, List<TreeExp>, TreeExp> f) {

    List<CanonizedExp> clistRev = new LinkedList<>(clist);
    Collections.reverse(clistRev);

    LinkedList<TreeExp> joined = new LinkedList<>();
    List<TreeStm> stms = new LinkedList<>();
    for (CanonizedExp c : clistRev) {
      CanonizedExp ca = compose(c, stms);
      stms = ca.getBody();
      joined.addFirst(ca.getExp());
    }
    CanonizedExp c = compose(b1, stms);
    return new CanonizedExp(c.getBody(), f.apply(c.getExp(), joined));
  }

  List<TreeStm> toStm(Function<TreeExp, TreeStm> f) {
    LinkedList<TreeStm> res = new LinkedList<>(getBody());
    res.add(f.apply(getExp()));
    return res;
  }

  static List<TreeStm> toStm(CanonizedExp b1, CanonizedExp b2,
                             BiFunction<TreeExp, TreeExp, TreeStm> f) {
    CanonizedExp c = compose(b1, b2.getBody());
    LinkedList<TreeStm> res = new LinkedList<>(c.getBody());
    res.add(f.apply(c.getExp(), b2.getExp()));
    return res;
  }

  /**
   * Given inputs (s, e) and t, this function returns a pair (u,e') such that u
   * has the same side effects as s;t and after running u the expression e' has
   * the same value as the expression e has after evaluating s.
   */
  private static CanonizedExp compose(CanonizedExp c, List<TreeStm> stms) {
    if (stms.isEmpty()) {
      return c;
    }

    List<TreeStm> newstms = new LinkedList<>();
    newstms.addAll(c.getBody());

    if (commute(stms, c.getExp())) {
      newstms.addAll(stms);
      return new CanonizedExp(newstms, c.getExp());
    } else {
      TreeExp t = new TreeExpTemp(new Temp());
      newstms.add(new TreeStmMove(t, c.getExp()));
      newstms.addAll(stms);
      return new CanonizedExp(newstms, t);
    }
  }

  /**
   * Returns true if s and e commute, i.e. if the execution of s does not change
   * the value of e.
   */
  private static boolean commute(TreeStm s, TreeExp e) {
    return (e instanceof TreeExpName) || (e instanceof TreeExpConst);
    // could have more cases here
  }

  private static boolean commute(List<TreeStm> stms, TreeExp e) {
    return stms.stream().allMatch(s -> commute(s, e));
  }

}
