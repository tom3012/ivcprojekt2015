# Babytux - Ein Povray-Film
## Eine Projektarbeit für Interactive Visual Computing an der Universität Hamburg

Dieser Povray-Film wird aktuell im Rahmen einer Projektarbeit an der Universität
Hamburg aktiv entwickelt.

### Dokumentation

Das Projekt wird im Verzeichnis *./documentation/* in LaTeX dokumentiert.

### Povray-Styleguide

Abschnitte trennen:
Immer eine Kopfzeile mit Beschreibung:

    //------------------------------------------------------------------------------
    // Deklerationen


Objekte, Schnittmengen, Algebra etc. mit einer Zeile, mit Leerzeichen versehen:

    background{ Ausdruck }


Objekte, Schnittmengen, Algebra etc. mit mehreren Zeilen:

    union{
     erster Ausdruck
     zweiter Ausdruck
    }


Vektoren und mathematische Ausdrücke mit Leerzeichen versehen; zwischen
Funktion und Vektor Leerzeichen lassen:

    rotate <x, y, z>
    5 + 6 * 7


Kommentare immer mit Leerezeichen:

    // Kommentar


### Povray-Dateien

Eine Povray-Datei kann mit folgendem Befehl zu einem Bild im png-Format verarbeitet
werden:

    povray DATEI.pov +W1024 +H716

Der folgende Befehl erstellt mehrere Bilddateien, falls in der povray-Datei 
Animationssequenzen vorgesehen sind:

    povray DATEI.pov +W512 +H400 +KFI0 +KFF11

Diese Bilddateien können schließlich mit 

    animate Datei*.pov

in eine Animationssequenz umgewandelt werden.

***

##### Hintergründe und Quellen

Vorlage für die Hauptfigur des hier beschriebenen Films ist das Maskottchen des
freien Kernels Linux. Dieses stellt einen Pinguin dar und wird kurz
Tux genannt. Tux wurde im Jahr 1996 von Larry Ewing mit
der Bildbearbeitungssoftware GIMP entworfen und steht seitdem zur freien
Verfügung für die Gemeinde. Er darf nach Belieben verwendet und verändert
werden, solange auf Nachfrage sowohl [Urheber](lewing@isc.tamu.edu) als
auch das [verwendete Programm](https://www.gimp.org) genannt werden.

Die Hauptfigur des Filmes wurde nach 
[diesem](http://tux.crystalxp.net/de.id.1568-overlord59-overlord59-tux-g2.html) 
Vorbild entwickelt. Das gezeigte Modell stammt vom Autor Overlord59 des 
Crystalxp.net-Teams und wurde unter Creative Commons BY-NC-SA veröffentlicht. 
[(Quelle, ](http://tux.crystalxp.net/de.id.1568-overlord59-overlord59-tux-g2.html)
Achtung massive Werbeeinblendungen!)
