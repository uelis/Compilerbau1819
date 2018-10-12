import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Main {

  public static void main(String[] args) throws IOException, Exception {

    if (args.length == 0) {
      System.out.println("First argument must be file name of straigtline program.");
      System.exit(-1);
    }

    String filename = args[0];

    try (FileInputStream inp = new FileInputStream(filename)) {

      // Lexer und Parser erstellen
      Lexer lex = new Lexer(new BufferedReader(new InputStreamReader(inp)));
      Parser parser = new Parser(lex);
      Stm stm;
      try {
        // Eingabeprogramm als Stm einlesen
        stm = (Stm) parser.parse().value;
      } catch (ParseException ex) {
        throw new Error("Parse error!\n" + ex.getMessage());
      }

      System.out.println("Eingelesenes Programm:");
      ToString.StmVisitor toStringVistor = new ToString.StmVisitor();
      System.out.println(stm.accept(toStringVistor));
      System.out.println();

      System.out.println("Interpretiere eingelesenes Programm.");
      // TODO

    } catch (FileNotFoundException e) {
      throw new Error("File not found: " + filename);
    }
  }
}
