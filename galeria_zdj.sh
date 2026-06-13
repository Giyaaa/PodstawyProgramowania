#!/bin/bash

WYNIK_ZIP="wynik.zip"
WYNIK_DIR="wynik"
FOLDER="galeria"
INDEKS="$FOLDER/index.html"

unzip -o "$WYNIK_ZIP" -d "$WYNIK_DIR"

mkdir -p "$FOLDER"

cp "$WYNIK_DIR"/*.jpg "$FOLDER/"
 
cat > "$INDEKS" << 'naglowek'
<!DOCTYPE html>
<html>
<head>
  <style>
    * {box-sizing: border-box; font-family: sans-serif;}
    .responsive {padding: 0 6px; float: left; width: 24.99999%;}
    .clearfix:after {content: ""; display: table; clear: both;}
    @media only screen and (max-width: 700px) {.responsive {width: 49.99999%; margin: 5px 0;}}
    @media only screen and (max-width: 500px) {.responsive {width: 100%; }}
    div.gallery {border: 1px solid #ccc;}
    div.gallery:hover {border: 1px solid #777;}
    div.gallery img {width: 100%; height: auto;}
    div.desc {padding: 15px; text-align: center;}
  </style>
  <title>Dumb Image Gallery</title>
</head>

<body>
<h2>Dumb Image Gallery</h2>
<h4>Foo Bar GraphiC DesigneR</h4>

naglowek

for f in "$FOLDER"/*.jpg; do
    [ -f "$f" ] || continue
    fname=$(basename "$f")
    cat >> "$INDEKS" << kloc
<div class="responsive">
  <div class="gallery">
    <a target="_blank" href="$fname">
      <img src="$fname">
    </a>
    <div class="desc">$fname</div>
  </div>
</div>

kloc
done

cat >> "$INDEKS" << 'st0pka'
<div class="clearfix"></div>
</body>
</html>
st0pka
