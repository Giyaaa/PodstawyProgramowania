#!/bin/bash

# pl-7.2.json5 — każda linia z kluczem zdublowana: komentarz + wpis
awk '/^  "/{print "// " $0} {print}' en-7.2.json5 > pl-7.2.json5
echo "Zapisano: pl-7.2.json5"

# wyodrębnij posortowane klucze z obu wersji
grep -o '"[^"]*":' en-7.2.json5 | sed 's/://;s/"//g' | sort > /tmp/keys72.txt
grep -o '"[^"]*":' en-7.4.json5 | sed 's/://;s/"//g' | sort > /tmp/keys74.txt

# nowe klucze = są w 7.4, ale nie ma ich w 7.2
comm -13 /tmp/keys72.txt /tmp/keys74.txt > /tmp/new_keys.txt

# pl-7.4.json5 — tylko nowe wpisy
echo "{" > pl-7.4.json5
echo "" >> pl-7.4.json5
while IFS= read -r key; do
    grep "\"$key\":" en-7.4.json5 >> pl-7.4.json5
    echo "" >> pl-7.4.json5
done < /tmp/new_keys.txt
echo "}" >> pl-7.4.json5

echo "Zapisano: pl-7.4.json5 ($(wc -l < /tmp/new_keys.txt) nowych kluczy)"
