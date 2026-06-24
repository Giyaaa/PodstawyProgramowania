#!/bin/bash

unzip -o -q kopie-1.zip
unzip -o -q kopie-2.zip

mkdir -p kopie

for file in *.zip
do
    if [[ "$file" == "kopie-1.zip" || "$file" == "kopie-2.zip" ]]
    then
        continue
    fi

    year=$(cut -d'-' -f1 <<< "$file")
    month=$(cut -d'-' -f2 <<< "$file")

    mkdir -p "kopie/$year/$month"

    mv "$file" "kopie/$year/$month/"
done

echo "Gotowe."
