#Taller 2
*Métodos Computacionales - Laboratorio*

03-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller2/. No olvide al final hacer un *commit* y un *push*.

## Lotería

1. Escriba  un script de `bash` llamado `loteria.sh` que determine si su taller es afortunado y va a ser revisado. La información necesaria siempre va a estar en el momento adecuado en el archivo [lottery](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv). Además de imprimir si el taller va a ser o no revisado también se debe imprimir la primera línea del archivo `csv` que tiene la fecha. Guárdelo en la carpeta de ejecutables de su computador.

## Expresiones Regulares

1. Descargue el [archivo](http://www.minhacienda.gov.co/portal/page/portal/HomeMinhacienda/presupuestogeneraldelanacion/ProyectoPGN/2015/Presentacion%20Proyecto%202015.pdf) del Ministerio de Hacienda con información sobre el Presupuesto General de la Nación 2015. Abra el archivo, diríjase a la página 10, haga *copy-paste* los datos de la tabla comenzando en *EDUCACIÓN* y terminando en *100,0*, guárdelos en un archivo llamado `pgn.dat`. Escriba comandos de `sed` que lleven a cabo las siguientes tareas de búsqueda y reemplazo y aplíquelos secuencialmente sobre el archivo `pgn.dat`: 

	* eliminar todos los puntos,

	* cambiar por puntos todas las comas que estén seguidas de algún dígito,

	* cambiar por `tab` todos los espacios en blanco que estén seguidos de algún dígito o por (,

	* eliminar todos los paréntesis derechos,

	* y por último cambiar todos los paréntesis izquierdos por -. El resultado final debe quedar guardado en el archivo `pgn.tsv`.

	* Finalmente usar `sort --field-separator=$'\t' ...`  y `head` para organizar el archivo de acuerdo al cambio porcentual y encontrar el sector con el menor cambio porcentual.

## gnuplot

1. Haga con [Saturno](http://nssdc.gsfc.nasa.gov/planetary/factsheet/saturniansatfact.html) lo mismo que hicimos con Júpiter: limpiar el archivo llevándolo a formato `csv` y hacer una gráfica con `gnuplot` que evalúe la tercera ley de Kepler. Hay que tener especial cuidado con la columna para el periodo de rotación.

**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**

#Solución

Código implementado para **Expresiones Regulares**

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

Código implementado para **Lotería**

```
#!/bin/bash


wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv

printf "La tarea "
awk -F"," '{if($1==201327449) print $2}' lottery.csv

x=$(head -1 lottery.csv)

printf "la fecha es: "

printf "%s %s %s %d\n" $x

rm lottery.csv

```

Implementación de **gnuplot**

Para implementar gnuplot, primero es necesario copiar y pegar el texto en un archivo de texto, y usando `cmnd+f` en el edidtor de texto, se pueden empezar a reemplazar los valores, hasta poder convertir el archivo en un csv. 

Además se implementa el siguiente código:

```
gnuplot

set datafile separator ","

cuad(x)=x**2
cube(x)=x**3

plot saturno.csv cuad(4) cube(5)
``` 
