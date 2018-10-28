package minijava.syntax;

import java.util.List;

public class Program {

  final public MainClassDeclaration mainClass;
  final public List<ClassDeclaration> classes;

  public Program(MainClassDeclaration mainClass, List<ClassDeclaration> classes) {
    this.mainClass = mainClass;
    this.classes = classes;
  }

  @SuppressWarnings("unused")
  public String prettyPrint() {
    return PrettyPrint.prettyPrint(this);
  }
}
