# Compilerbau WS18/19

Dieses Projekt enthält alle Materialen zum Compilerbaupraktikum im
Wintersemester 2018/19.

## Vorlesungsfolien

Die [Vorlesungsfolien](lecture/slides.pdf) werden wöchentlich
aktualisiert.

## Minijava

- [Grammatik](minijava.txt)
- [Beispielprogramme](src/MiniJava_Examples)
- [Präzedenzen der Operatoren in Java](https://introcs.cs.princeton.edu/java/11precedence/)

## Übung 1 (15.10.)

[Programmrahmen für den Straightline-Interpreter](src/Straightline)

## Übung 2 (22.10.)

[Lexer und Parser für Straightline-Programme](src/StraightlineParser)

## Übung 3 (29.10.)

Beispiel zur Lösung von Konflikten:
- [Grammatik mit Konflikten](lecture/lists_problem.cup)
- [Lösung 1](lecture/lists_solution1.cup)
- [Lösung 2](lecture/lists_solution2.cup)

Datentypen für die abstrakte Syntax von Minijava:
- [Java](src/Java)
- [Haskell](src/Haskell)
- [Rust](src/Rust)

## Übung 4 (05.11.)

Fertigstellung des Parsers, Beginn Symboltabelle und Typchecker

## Übung 5 (12.11.)

Fertigstellung Symboltabelle und Typchecker

## Übung 6 (19.11.)

Übersetzung in Zwischensprache

Datentypen für die abstrakte Syntax der Zwischensprache:
- [Java](src/Java/minijava/intermediate)
- [Haskell](src/Haskell)
- [Rust](src/Rust)

Zum Testen können Programme des Tree-Zwischencodes in C-Programme übersetzt werden.
- Java: Die Methode [CmmPrinter.prgToCmm](src/Java/minijava/intermediate/CmmPrinter.Java) kann ein Tree-Programm direkt in ein C-Programm umwandeln.
- Haskell/Rust: Das externe Tool [tree2c](tools/tree2c) übersetzt Tree-Programme nach C.

Der so generierte C-Code kann z.B. so übersetzt werden
```
  gcc -m32 <generierter code>.c runtime.c  
```
Es wird die Datei [runtime.c](tools/tree2c/runtime.c) verwendet.
