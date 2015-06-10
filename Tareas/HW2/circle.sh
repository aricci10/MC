#!/bin/bash
#Designamos un script de bash.

#Entramos a la plataforma de Gnuplot.
gnuplot << EOF

#Se designa que las gráficas que queden en la terminal.
set terminal dumb
#Se establece una gráfica patamétrica.
set parametric
#Se establecen rangos para las variables y los ejes.
set trange [0:2*pi]
set size ratio 1
set xrange[-1:1]
set yrange[-1:1]

#Se dice que variables graficaremos.
x(t) = $1*cos(t)
y(t) = $1*sin(t)

#Hacemos desaparecer el recuadro
unset key
unset border
unset xtics
unset ytics


plot x(t),y(t)

EOF
