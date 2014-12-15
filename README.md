Ablauf
======
1. Import mit itf2avpool
 * Umwandlung in CH-Modell
 * Transformation nach LV95 (SO und CH)
2. Prozessierung nach MOpublic mit GeoKettle:
 * inkl. zusätzliche AV-WMS Tabellen (das meiste geht mit Views)
3. Export von GPKG und Spatialite (mehr oder weniger vorhanden) mit Python (Shape aklären).
