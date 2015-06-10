#!/bin/bash

#Los dos primeros parámetros son las letras que intercambiaremos, el tercero es el archivo que se modificará.
sed -e "s/$1/-$1/g" $3 | sed -e "s/$2/-$2/g" | sed -e "s/-$1/$2/g" | sed -e "s/-$2/$1/g" >> Permutado.txt


#El archivo debe estar compuesto de minúsculas para que el método funcione correctamente.
cat Permutado.txt

rm Permutado.txt
