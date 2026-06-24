#!/bin/bash

set -e
unzip -o -q kopie-1.zip
unzip -o -q kopie-2.zip

for zip in *.zip; do
    unzip -o -q "$zip"
done
# DPI = 96, wysokość = 720 px, format = JPG
mogrify -units PixelsPerInch -density 96 -resize x720 -format jpg *.png *.jpg
rm -rf podpisy
mkdir -p podpisy

for img in *.jpg; do
    magick "$img" \
        -gravity south \
        -background white \
        -splice 0x40 \
        -pointsize 14 \
        -annotate +0+8 "$(basename "$img")" \
        "podpisy/$img"
done
rm -f strony_*.png

page=1
files=(podpisy/*.jpg)
count=${#files[@]}
i=0

while [ $i -lt $count ]; do

    part=( "${files[@]:i:8}" )

    magick montage \
        "${part[@]}" \
        -tile 2x4 \
        -geometry 480x360+30+30 \
        -background white \
        -border 20 \
        -bordercolor white \
        strony_${page}.png

    i=$((i+8))
    page=$((page+1))
done
magick strony_*.png \
    -density 96 \
    -page A4 \
    -background white \
    portfolio.pdf
zip -q -o wynik.zip *.jpg

mkdir -p wynik
mv wynik.zip wynik/

rm -f strony_*.png

echo "Gotowe! Utworzono portfolio.pdf"
