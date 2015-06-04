#!/bin/bash

# Se descarga en archivo kepler.csv
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/kepler.csv

# Se imprime el número de planetas contanto la cantidad de líneas y eliminando la primera ya que es de formato.
printf "%s %d\n" "El número de planetas es: " $(($(wc -l kepler.csv | sed 's/kepler.csv//g') - 1))

# Se buscan los planetas que tienen una masa menor que una centésima de la masa de júpiter.
awk -F"," '{if($2>0 && $2<0.01) print $1}' kepler.csv >> MenoresQueJupiter.txt

# Se imprime el número de planetas livianos, contanto la cantidad de líneas
printf "%s %d\n" "El número de planetas livianos es: "  $(wc -l MenoresQueJupiter.txt | sed 's/MenoresQueJupiter.txt//g')

# Se imprimen los nombres de los planetas livianos
printf "%s\n" "Los planetas livianos son: " 

cat MenoresQueJupiter.txt


cut -d"," -f 6 kepler.csv >> kepler1.csv

# Se reordenan los archvos para encontrar el planeta con menor periodo
sort -n kepler1.csv >> keplerOrdenados.csv

# Se encuentra cual es el periodo del planeta con periodo más corto
per=$(head -2 keplerOrdenados.csv | tail -1)

# Se imprimen los resultados obtenidos
printf "%s %f\n" "El periodo más corto es de:" $per
printf "y el planeta con dicho periodo es: "
awk -F"," -v x=$(head -2 keplerOrdenados.csv | tail -1) '{if($6==x) print $1}' kepler.csv

# Se eliminan los archivos temporales
rm kepler1.csv 
rm keplerOrdenados.csv
rm MenoresQueJupiter.txt
rm kepler.csv