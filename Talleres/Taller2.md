```
#!/bin/bash



rm pgn.dat
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller2/pgn.dat
sed -i.bak 's/\.//g' pgn.dat
sed -E -i.bak 's/,([0-9])/.\1/g' pgn.dat
sed -E -i.bak 's/ (\()/	\1/g' pgn.dat
sed -E -i.bak 's/ ([0-9])/	\1/g' pgn.dat
sed -E -i.bak 's/\)//g' pgn.dat
sed -E 's/\(/-/g' pgn.dat >> pgn.tsv


sort -n --key=4 --field-separator=$'\t' pgn.tsv >> pgn1.tsv

printf "%s\n" "El sector con menor cambio porcentual es: "

awk '{print $1}' pgn1.tsv >> Sectores.tsv


head -1 Sectores.tsv

rm pgn.dat
rm pgn1.tsv
rm pgn.tsv
rm Sectores.tsv
``` 
