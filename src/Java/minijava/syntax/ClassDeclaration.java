package minijava.syntax;

import java.util.List;

public class ClassDeclaration {

  private final String className;
  private final String superName;
  private final List<VariableDeclaration> fields;
  private final List<MethodDeclaration> methods;

  public ClassDeclaration(String className,
                          List<VariableDeclaration> fields, List<MethodDeclaration> methods) {
    this(className, null, fields, methods);
  }

  public ClassDeclaration(String className, String superName,
                          List<VariableDeclaration> fields, List<MethodDeclaration> methods) {
    this.className = className;
    this.superName = superName;
    this.fields = fields;
    this.methods = methods;
  }

  public String getClassName() {
    return className;
  }

  public String getSuperName() {
    return superName;
  }

  public List<VariableDeclaration> getFields() {
    return fields;
  }

  public List<MethodDeclaration> getMethods() {
    return methods;
  }
}
