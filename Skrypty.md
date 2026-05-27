# PodstawyProgramowania
Zadanie 3
{ printf "x\ty\tz\n"; sed 's/\r//' dane.txt | paste - - -; } > dane_kolumny.txt

Zadanie 4
pacman -S diffutils
cd D:\maja (folder gdzie są pliki do których będziemy wchodzić)
panman -S dos2unix (zmiana formatu na unix)
dos2unix lista.txt
dos2unix lista-pop.txt
difff -u lista.txt lista-pop.txt > lista.patch
less lista.patch (sobie zobaczyć jak wygląda ten plik w środku)
panman -S patch
patch lista.txt < lista.patch
md5sum lista.txt > suma-md5-lista.txt
nano suma-md5-lista.txt (usuwamy na końcu nazwe pliku i znak *)
md5sum lista-pop.txt > suma-md5-lista-pop.txt
nano suma-md5-lista-pop.txt (usuwamy na końcu nazwe pliku i znak *)
diff -s suma-md5-lista.txt suma-md5-lista-pop.txt (porównujemy czy są identyczne)

Zadanie 5
pacman -S awk
pacman -S tail     (tail skipuje linie 2)    (-F';' ustawia separator pól na ;)        ($s to jest string podobnie to działa do C)  (awk sam przypisuje oddzielone pola w lini do $1, $2, ...)
tail -n +2 steps-2sql.csv | awk -F';' '{ printf "INSERT INTO stepsData (time, intensity, steps) VALUES (%s, %s, %s);\n", $1, $2, $3 }' > steps.sql
printf "dateTime;steps;synced"

Zadanie 6
cd (miejsce w którym są pliki en-7.2.json5 i en-7.4.json5)
nano tlumacz.sh
(wpisz podany niżej kod do pliku tlumacz.sh)
#!/bin/bash
(/^  "/ znaczy szukaj lini która zaczyna sie (^) od dwóch spacji i ") ({print "// " $0} mówi by wypisać // + spacja w lini która jest właśnie przetwarzana) ({print} to akcja drukuj)
awk '/^  "/{print "// " $0} {print}' en-7.2.json5 > pl-7.2.json5
echo "Zapisano: pl-7.2.json5"

(grep -o wypisuje dany fragment lini) ('"[^"]*":' wzorzec co ma szukać [^"]* to dowolny ciąg znaków) (sed podmienia 's/://;s/"//g' : na nic oraz " na nic)
grep -o '"[^"]*":' en-7.2.json5 | sed 's/://;s/"//g' | sort > /tmp/keys72.txt
grep -o '"[^"]*":' en-7.4.json5 | sed 's/://;s/"//g' | sort > /tmp/keys74.txt

comm -13 /tmp/keys72.txt /tmp/keys74.txt > /tmp/new_keys.txt

echo "{" > pl-7.4.json5
echo "" >> pl-7.4.json5
while IFS= read -r key; do
    grep "\"$key\":" en-7.4.json5 >> pl-7.4.json5
    echo "" >> pl-7.4.json5
done < /tmp/new_keys.txt
echo "}" >> pl-7.4.json5

echo "Zapisano: pl-7.4.json5 ($(wc -l < /tmp/new_keys.txt) nowych kluczy)"
