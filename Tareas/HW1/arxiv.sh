#!/bin/bash

# Se recibe la palabra clave, y se redirige su impresión a un archivo con el fin de que no se imprima en la consola el valor ingresado
echo $1 >> ArchivoInervible.txt

# Se obtiene el código HTML de la página y se redirige a un archivo de texto
curl http://arxiv.org/list/astro-ph/new >> CodigoFuente.txt

# Se buscan los títulos dentro del código fuente y se redirigen a un nuevo archivo de texto
grep -i Title CodigoFuente.txt >> Titulos.txt

# Se busca la palabra clave dentro del archivo de texto de títulos, y se redirige a un nuevo archivo con los titulos seleccionados
grep -i $1 Titulos.txt >> TitulosSeleccionados.txt

# Se elimina el código de encabezado que viene en HTML
sed 's/\<span class="descriptor"\>Title\:\<\/span\>//g' TitulosSeleccionados.txt > TitulosFinales.txt

# Se imprimen en consola los valores solicitados, varias de las siguientes líneas son simplemente formato. 
figlet arXiv 

printf "%s\n" "\\_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_//" 
 
printf "%s\n" "Se desean buscar nuevos archivos en: " 

printf "%s\n" "http://arxiv.org/list/astro-ph/new" 

printf "%s\n" "\\_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_//" 

printf "%s %s\n" "Palabra clave de búqueda:" $1 

printf "%s\n" "\\_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_//"  

printf "%s %d %s\n" "Se obtuvieron" $(wc -l TitulosFinales.txt | sed | sed 's/TitulosFinales.txt//g') "resultados con dicha entrada"

printf "\n%s\n\n" "Los títulos con esas palabras claves son: "

cat TitulosFinales.txt

# Se eliminan los los archivos temporales creados
rm CodigoFuente.txt
rm ArchivoInervible.txt
rm Titulos.txt
rm TitulosFinales.txt
rm TitulosSeleccionados.txt
