Die Progamme lassen sich mit gradle übersetzen.
```
 ./gradlew build
```

Dabei werden aus den Dateien `Lexer.jflex` und `Parser.cup` mit
JFlex und JavaCup die Java-Dateien `Lexer.java` und `Parser.java`
generiert.

Nach der Übersetzung laesst sich das Programm so ausführen:
```
  java -jar build/libs/JavaNoSemanticActions-all.jar <Eingabedatei>
```

Im Verzeichnis examples gibt es einige Beispielprogramme. Beispiel:
```
  java -jar build/libs/JavaNoSemanticActions-all.jar examples/t3.sl
```
