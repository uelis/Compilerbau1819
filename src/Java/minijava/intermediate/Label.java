package minijava.intermediate;

public final class Label {

  private static int nextId = 0;
  private final String name;  // invariant: always non-null

  /**
   * Generates a fresh label.
   */
  public Label() {
    name = "L$$" + nextId++;
  }

  /**
   * Generates a label with the given name.
   * <p>
   * The parameter {@code name} must not be null.
   * Names starting with {@code $$} are reserved and may not be used.
   *
   * @param name Name of label
   */
  public Label(String name) {
    if (name == null) {
      throw new NullPointerException();
    }
    if (name.startsWith("$$")) {
      throw new RuntimeException("Label name " + name + " is reserved and cannot be used");
    }
    this.name = "L" + name;
  }

  public static void resetCounter() {
    nextId = 0;
  }

  @Override
  public String toString() {
    return name;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    Label label = (Label) o;

    return name.equals(label.name);
  }

  @Override
  public int hashCode() {
    return name.hashCode();
  }
}
