# Putzplan

Baut einen aktuellen Putzplan für beide WG-Seiten mit einem `make`.

Zum Generieren des Plans brauchst du `make`, einen C++ Compiler (z.B. `gcc`) sowie "date\_time" und "program options" aus der Boost Library und zum Bauen der Dokumente `pdflatex`.

Unter Debian/Ubuntu reichen folgende Paketinstallationen:
```
$ sudo apt install make g++ libboost-date-time-dev libboost-program-options-dev texlive texlive-lang-german
```

Einen aktuellen Plan erzeugst du mit:
```
$ make clean all
```
