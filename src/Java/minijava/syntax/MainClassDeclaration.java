package minijava.syntax;

public class MainClassDeclaration {

  private final String className;
  private final String mainArg;
  private final Stm mainBody;
  private final boolean throwsIOException;

  public MainClassDeclaration(String className, String mainArg, boolean throwsIOException, Stm mainBody) {
    this.className = className;
    this.mainArg = mainArg;
    this.throwsIOException = throwsIOException;
    this.mainBody = mainBody;
  }

  public String getClassName() {
    return className;
  }

  public String getMainArg() {
    return mainArg;
  }

  public boolean throwsIOException() {
    return throwsIOException;
  }

  public Stm getMainBody() {
    return mainBody;
  }
}

