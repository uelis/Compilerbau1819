package minijava.syntax;

import java.util.Collections;
import java.util.List;

public class MethodDeclaration {

  private final Type returnType;
  private final Boolean throwsIOException;
  private final String methodName;
  private final List<Parameter> parameters;
  private final List<VariableDeclaration> localVars;
  private final Stm body;
  private final Exp returnExp;

  public MethodDeclaration(Type returnType,
                           boolean throwsIOException,
                           String methodName,
                           List<Parameter> parameters,
                           List<VariableDeclaration> localVars,
                           Stm body,
                           Exp returnExp) {
    this.returnType = returnType;
    this.throwsIOException = throwsIOException;
    this.methodName = methodName;
    this.parameters = parameters;
    this.localVars = localVars;
    this.body = body;
    this.returnExp = returnExp;
  }

  public Type getReturnType() {
    return returnType;
  }

  public Boolean throwsIOException() {
    return throwsIOException;
  }

  public String getMethodName() {
    return methodName;
  }

  public List<Parameter> getParameters() {
    return Collections.unmodifiableList(parameters);
  }

  public List<VariableDeclaration> getLocalVars() {
    return Collections.unmodifiableList(localVars);
  }

  public Stm getBody() {
    return body;
  }

  public Exp getReturnExp() {
    return returnExp;
  }
}

