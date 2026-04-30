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
