#Taller 4
*Métodos Computacionales - Laboratorio*

17-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller4/. No olvide al final hacer un *commit* y un *push*.

# interpolación

1. Del segundo capítulo del [libro de Scherer](http://link.springer.com.ezproxy.uniandes.edu.co:8080/book/10.1007\%2F978-3-642-13990-1) resuelva los literales c y d del problema 2.1.

2. Leer del libro [Numerical Methods and Optimization](http://ezproxy.uniandes.edu.co:8080/login?url=http://dx.doi.org/10.1007/978-3-319-07671-3) de *Eric Walter* los ejemplos de la sección 5.2: *Computer experiments*, *Prototyping* y *Mining surveys*.  

3. La implementación de cierto algoritmo necesita puntos uniformemente muestreados pero los datos que se tienen son los mostrados en la tabla de abajo. Produzca una nueva tabla con el mismo número de líneas pero con muestreo uniforme usando un *cubic spline* .

	| x        | y           |
| ------------- | ------------- |
|0.138490669327|2.30060161547|
|0.153824397539|2.31193402603|
|0.229578204444|2.30212660197|
|0.266435179672|2.25835963399|
|0.276929414769|2.24136088402|
|0.334159056347|2.11468161418|
|0.383612191183|1.96176872424|
|0.446434890218|1.71619353619|
|0.541989923364|1.25473903911|
|1.33433323552|-1.434111205|
|1.44538290595|-1.20791779482|
|1.51883847305|-0.991229025177|
|1.6057389642|-0.687154743681|
|1.74396177688|-0.152610073833|
|1.87038245824|0.324964643125|
|2.30863773381|1.31618219677|
|2.38628525713|1.37058691008|
|2.46587111271|1.4006163649|
|2.65137821271|1.41356286272|
|2.75152244191|1.41133466756|
|2.82756611885|1.41289890942|
|4.19566321688|0.0396966472625|
|4.3105185461|-0.0681282942773|
|4.45641816306|-0.0704087548339|


**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**


#Trabajo

##Literal C de los puntos del libro.

El código implementado para lograr la primera parte fue:

```
%pylab inline
from scipy import interpolate
x=[0,pi/2,pi,3*pi/2,2*pi]
y=sin(x)
lag=interpolate.lagrange(x,y)
lin=interpolate.interp1d(x,y,kind='linear')
cub=interpolate.interp1d(x,y,kind='cubic')
x2=linspace(0,2*pi,100)
fig=figure(figsize=(15,10))
ax0=fig.add_subplot(2,2,1)
ax1=fig.add_subplot(2,2,2)
ax1.plot(x2,lag(x2),label='Lagrange')
ax2=fig.add_subplot(2,2,3)
ax2.plot(x2,lin(x2), label='Lineal')
ax3=fig.add_subplot(2,2,4)
ax3.plot(x2,cub(x2), label='Cubic')
for ax in fig.axes:
    ax.scatter(x,y,label="data",c='r')
    ax.legend(fontsize=8)
```

El código implementado para la segunda parte fue:

```
%pylab inline
from scipy import interpolate
x3=[0,pi/4,pi/2,3*pi/4,pi,5*pi/4,3*pi/2,7*pi/4,2*pi]
y3=sin(x3)
lag2=interpolate.lagrange(x3,y3)
lin2=interpolate.interp1d(x3,y3,kind='linear')
cub2=interpolate.interp1d(x3,y3,kind='cubic')
x2=linspace(0,2*pi,100)
fig=figure(figsize=(15,10))
ax0=fig.add_subplot(2,2,1)
ax1=fig.add_subplot(2,2,2)
ax1.plot(x2,lag2(x2),label='Lagrange')
ax2=fig.add_subplot(2,2,3)
ax2.plot(x2,lin2(x2), label='Lineal')
ax3=fig.add_subplot(2,2,4)
ax3.plot(x2,cub2(x2), label='Cubic')
for ax in fig.axes:
    ax.scatter(x3,y3,label="data",c='r')
    ax.legend(fontsize=8)
```

##Punto 3

El código implementado fue:

```
%pylab inline
from scipy import interpolate
x=[0.138490669327,0.153824397539,0.229578204444,0.266435179672,0.276929414769,0.334159056347,0.383612191183,0.446434890218,0.541989923364,1.33433323552,1.44538290595,1.51883847305,1.6057389642,1.74396177688,1.87038245824,2.30863773381,2.38628525713,2.46587111271,2.65137821271,2.75152244191,2.82756611885,4.19566321688,4.3105185461,4.45641816306]
y=[2.30060161547,2.31193402603,2.30212660197,2.25835963399,2.24136088402,2.11468161418,1.96176872424,1.71619353619,1.25473903911,-1.434111205,-1.20791779482,-0.991229025177,-0.687154743681,-0.152610073833,0.324964643125,1.31618219677,1.37058691008,1.4006163649,1.41356286272,1.41133466756,1.41289890942,0.0396966472625,-0.0681282942773,-0.0704087548339]
cub=interpolate.interp1d(x,y,kind='cubic')
fig=figure(figsize=(15,10))
ax0=fig.add_subplot(2,1,1)
ax0.scatter(x,y)
x2=linspace(0.138490669327,4.45641816306,24)
ax1=fig.add_subplot(2,1,2)
ax1.scatter(x2,cub(x2))

i=0
while(i<24):
    print(x2[i],"       " ,cub(x2[i]))
    i+=1
```


