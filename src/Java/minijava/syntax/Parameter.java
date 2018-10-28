package minijava.syntax;

public class Parameter {

  private final String id;
  private final Type type;

  public Parameter(String id, Type type) {
    this.id = id;
    this.type = type;
  }

  public String getId() {
    return id;
  }

  public Type getType() {
    return type;
  }
}
