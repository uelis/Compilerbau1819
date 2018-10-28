package minijava.syntax;

public class VariableDeclaration {

  private final Type type;
  private final String name;

  public VariableDeclaration(Type type, String name) {
    this.type = type;
    this.name = name;
  }

  public Type getType() {
    return type;
  }

  public String getName() {
    return name;
  }
}
