# tree2c

`tree2c` übersetzt Programme der tree-Zwischensprache nach C.


## Installation

Für die Installation wird GHC benötigt. Die nötigen Dateien kann man
einfach automatisch mit Stack (https://www.haskellstack.org/) installieren.
Dann kann `tree2c` einfach mit
```
stack install
```
installiert werden.

Die Installation ist auch mit Cabal möglich:
```
cabal install
```

## Verwendung

`tree2c` liest die Datei, die im ersten Argument angegeben ist,
übersetzt sie nach C und schreibt das Ergebnis nach `stdout`. Wenn 
kein erstes Argument angegeben ist, wird die Eingable von `stdin`
gelesen. Das produzierte C-Programm kann zusammen mit der Datei 
`runtime.c` zu einer ausführbaren Datei übersetzt werden.

Umwandeln von [fact.tree](Examples/fact.tree) nach `fact.c`:
```
   tree2c fact.tree > fact.c
```
Übersetzen von `fact.c` zusammen mit `runtime.c`:
```
   gcc -m32 -o fact fact.c runtime.c
```
Das flag -m32 ist wichtig, damit im 32-Bit-Modus übersetzt wird.

Ausführen der übersetzten Datei:   
```
   ./fact
```   

