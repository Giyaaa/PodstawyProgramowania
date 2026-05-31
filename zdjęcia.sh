#!/bin/bash
unzip -o -q kopie-1.zip && unzip -o -q kopie-2.zip
for zip in *.zip; do unzip -o -q "$zip"; done

mogrify -units PixelsPerInch -density 96 -resize x720 -format jpg *.png *.jpg
zip -q -o wynik.zip *.jpg

mv wynik.zip ./wynik
rm *.jpg *.png *.zip