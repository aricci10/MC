#!/bin/bash

#TRABAJO REALIZADO POR ALFREDO RICCI Y NICOLÁS RANGEL

#Introducimos un método de bash que corta una string donde entran
#como parámetros los siguientes datos ${NombreArchivo: PrimerCaracter: NumCaracteresSiguientes}

#Se le debe restar uno a la variable ya que Bash entiende el primer caracter del archivo como 0.
PrimCaracter=$(($1-1))

#Se hace la resta entre los parámetros porque nos interesa cuando caracteres contar 
#desde el primer límite. Se le suma para compensar la operación efectuada en la primera variable.
CarSiguientes=$(($2-$1+1))

#Guardamos el archivo como un String.
archivo=$(cat $3)

printf "%s" ${archivo:PrimCaracter:CarSiguientes}


