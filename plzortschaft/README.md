PLZ / Ortschaft
===============

* Das Verzeichnis `/usr/lib/postgresql/9.3/bin` muss dem `PATH` hinzugefügt werden, da sich shp2pgsql etc. da drin befinden. 
* Ist mühsame wegen Encoding etc. In Zukunft umstellen auf `ili2pg`.
* Shape-Dateien von (swisstopo)[http://www.cadastre.ch/internet/cadastre/de/home/products/plz/data.html] herunterladen.
* Mit dem Skript `import_plz_ortschaft.sh` die Daten in die Datenbank importieren. *Achtung:* Das Skript muss angepasst werden für den ersten Import ("create schema...", shp2pgsql Parameter und "create view..."). Falls die Shape-Struktur ändert, muss das Skript ebenfalls angepasst werden.
