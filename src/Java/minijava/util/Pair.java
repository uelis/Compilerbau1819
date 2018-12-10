package minijava.util;

public class Pair<A, B> {

  private final A fst;
  private final B snd;

  public Pair(A first, B second) {
    if (first == null || second == null) {
      throw new NullPointerException();
    }
    this.fst = first;
    this.snd = second;
  }

  public A getFst() {
    return fst;
  }

  public B getSnd() {
    return snd;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    Pair<?, ?> pair = (Pair<?, ?>) o;

    return fst.equals(pair.fst) && snd.equals(pair.snd);
  }

  @Override
  public int hashCode() {
    int result = fst.hashCode();
    result = 31 * result + snd.hashCode();
    return result;
  }

  @Override
  public String toString() {
    return "<" + fst + ", " + snd + ">";
  }
}
