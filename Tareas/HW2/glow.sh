#!/bin/bash

#Inicializamos la variable del tiempo en 0.
t=0

while true
#Ciclo infinito que borrará el resultado previo siempre que comience.
do
clear
#Usamos la notación de bc para coseno elevado al cuadrado y lo guardamos en la variable r.
r=$(echo "c($t)^2" | bc -l)


printf "%s %f\n" "Radio:" $r

#Recurrimos al script anterior. 
./circle.sh $r

sleep 0.1

#Aumentamos tiempo cada vez que plotea.
t=$(echo "$t + 0.1" | bc -l)



done


