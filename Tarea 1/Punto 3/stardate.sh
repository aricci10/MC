#!/bin/bash

# Se descargan los archivos tsv y csv. 
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/hyg.csv
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/worldhistory.tsv

# Se recibe el año deseado por el usuario, y se redirige su impresión a un archivo temporal, para que no se imprima
echo $1 > ArchivoInservible.txt

# Se convierte el archivo worldhistory, de tsv a csv
sed 's/\ /,/g' worldhistory.tsv > worldhistory.csv

# Se imprime en un nuevo archivo, los hechos históricos ocurridos en el año dado por el usuiario
awk -v x=$1 '{if($1==x) print $2}' worldhistory.csv >> Temp1.txt

# Se reemplazan algunas comas que estaban generando problemas por espacios. 
sed 's/,/\ /g' Temp1.txt > temp2.txt

# Se busca en el archivo hyg.csv las estrellas que cumplen la condición de emitir su luz en la fecha que ingresa el usuario.
awk -F"," -v y=$((2015 - $1)) -v z=$((2016 - $1)) '{if($10>y && $10<z) print $8, $9}' hyg.csv >> estrellas.csv

# Las siguientes líneas están dedicadas a la impresión de los datos solicitados. Algunas de ellas son por simple formato
printf "%s\n" "%!@#%#$#$%ˆ&%ˆ&*ˆ$#@$%ˆ&*%$#@%!@#%#$#$%ˆ&%ˆ&*ˆ$#@$%ˆ&*%$#@%!@#%#$#$%ˆ&%ˆ&*ˆ$#@$%ˆ&*@"

figlet "Fechas Estelares"

printf "%s\n" "%!@#%#$#$%ˆ&%ˆ&*ˆ$#@$%ˆ&*%$#@%!@#%#$#$%ˆ&%ˆ&*ˆ$#@$%ˆ&*%$#@%!@#%#$#$%ˆ&%ˆ&*ˆ$#@$%ˆ&*@"

figlet $1

printf "%s\n" "%!@#%#$#$%ˆ&%ˆ&*ˆ$#@$%ˆ&*%$#@%!@#%#$#$%ˆ&%ˆ&*ˆ$#@$%ˆ&*%$#@%!@#%#$#$%ˆ&%ˆ&*ˆ$#@$%ˆ&*@"

printf "\n%s %d %s\n" "En el año" $1 "Se emitió la luz de las estrellas con orientaciones:"

printf "\n%s\n" "   RA     DEC"

printf "\n"

cat estrellas.csv | head -5

printf "\n%s\n" "Al mismo tiempo en la tierra ocurría: "

printf "\n"

cat Temp2.txt

# Se eliminan los archivos temporales generados
rm temp1.txt
rm ArchivoInservible.txt
rm worldhistory.tsv
rm Temp2.txt
rm estrellas.csv
rm worldhistory.csv
rm hyg.csv

