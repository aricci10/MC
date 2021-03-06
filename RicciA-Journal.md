#Primera Clase 27-May-2015

Aquí estoy comenzando el curso de **Metodos Computacionales**

Herramientas del curso:

+ Git
+ GitHub
+ Bash
+ C
+ Python

Los métodos a estudiar son:

+ Interpolación 
+ Análisis de Fourier
+ Linear Algebra
+ Integración y diferenciación numérica

Durante la primera clase iniciamos la introducción al curso. En esta introducción empezamos a trabajar con Git, creando el primer documento, que sería esta misma bitácora. Los comandos aprendidos más importantes para trabajar en Git fueron: 

+ Git clone
+ Git add
+ Git commit
+ Git pull
+ Git push

#Segunda Clase 29-May-2015

##Laboratorio

Durante el laboratorio de hoy trabajamos en Markdown, bash y awk. En cuánto a Markdown la idea fue crear un archivo básico usando las diferentes posibilidades de edición que ofrece el lenguaje, como implementación de código, listado y numerado y uso de secciones y subsecciones. 

En cuanto a bash trabajamos en la creación de un programa que fuera capaz de sumar dos números que entraban por consola. Para ello se usó el comando 

```
echo $1, $2, $n
```

El cual es capaz de almacenar datos recibidos por consola en diferentes variables. También usamos un poco del comando `printf` con el cual imprimimos en un archivo .csv los número del uno al mil y sus cuadrados. El código usado fue:

```
#!/bin/bash
for i in {1..1000}
do
    printf "%d,%d\n" $i $((i * i)) >> cuadrados.csv
done
```

Finalmente en cuanto a awk, creamos un código que fuera capaz de sumar las dos culmnas de un archivo .csv. El código implementado fue el siguiente:

```
awk -F"," '{print(($1+$2))}' cuadrados.csv >> cuadradosSumados.csv
```


##Magistral

En la magistral trabajamos un poco más a fondo los principios de bash y git. En cuanto a Git, trabajamos en la recuperación de versiones anteriores de un repositorio. Dentro del trabajo realizamos un taller, el cual se basó en la recuperación de archivos antiguos mediante los hash de los diferentes *Commits*. El proceso realizado fue el siguiente:

+ Búsqueda del historial de los diferentes *Commits* mediante el uso del comando `git log`. 
+ Almacenamiento del hash generado por el *Commit*.
+ Selección del *Commit* mediante el comando `git checkout hash`

Para el taller realizado las respuestas fueron las siguientes:

Fecha Enero 5 del 2013 Hora: 23:05:56

Semana 15: Método de inferencia bayesiana

#Clase 3 2-Jun-2015

##Magistral 

Durante esta clase, trabajé en xpresiones regulares. Estas esxpersiones son de gran utilidad a la hora de limpiar archivos, o cconveritr archivos de un formato a otro. Una expresión regular que se puede utilizar para representar cuatro caracterer al comienzo de una línea seguidos de un espacio es:

```
^.... 
```

Posteriormente realicé un ejercicio más elaborado. Éste consistía en descargar 1 millon de dígitos de pi, y separarlos en líneas de 20 dígitos. Para ello empecé por descargar el código fuente y almacenarlo en un archivo de datos usando:

```
curl http://pi.karmona.com/ >> 1Mpi.dat
```

Posteriormente usando el programa *Text Wrangler*, edite el texto con la función cmnd+f. Fue necesario implementar las siguientes expresiones regulares.

```
#Buscar:
<BR>
#reemplazar:

#Buscar:
<B>
#reemplazar:

#Buscar:
</B>
#reemplazar:

#Buscar:
(....................)
#reemplazar:
\1\n
````

Se usa el parentesis para crear un grupo y `\1` para llamarlo devuelta. Finalmente fue necesario borrar manualmente el encabezado de código HTML, así como la parte final.

Finalmente trabajamos gráficas con GNUplot. Realicé una gráfica de los stélites jovianos usando el siguiente código:

```
gnuplot << EOF

#Se designa que las gráficas que queden en la terminal.
set terminal dumb
set datafile separator "," 
plot "$1" using $2:$3 with linesp

EOF
```

En donde `set terminal dumb` hace que la gráfica se imprima en la consola.


#Clase 6 9-Jun-2015

##Magistral

En el trabajo de hoy, estudié un poco acerca de **Make**. 

**Make** es una herramienta creada con el fin de facilitar procesos que dependen de más procesos. Quisiera resaltar una frase encontrada en los vídeos: *"Anything is worth repeating is worth automating"*. Bajo ete principio, existen muchos procesos para los cuales al actualizar un archivo es necesario actualizar archivos de los cuales depende el archivo inicial. A su vez estos archivos secundarios pueden depender de más archivos, haciendo que actualizar manualmente todos los archivos se convierta en una tarea tediosa y casi imposibe. Como solución a esta problemática surge **Make**, quién se encarga de automáticamente encontrar cual es el archivo que no depende de algún otro archivo y actualizarlo, para posteriormente en forma de "Bola de nieve" ir actualizando todos los archivos que dependan de él. 

Bajo esta lógica la implementación de algunos códigos de **Make** sería la siguiente:

```
#prueba.mk

ArchivoViejo.algo : ArvhivoNuevo.algo
    sgr -N -r ArchivoNuevo.algo > ArchvioViejo.algo

```

De este modo se crearía el archivo `prueba.mk`. Ahora para pdoer correrlo se usaría el siguiente código:

```
gmake -f prueba.mk
```

###Aporte al proyecto final 9-Jun-2015

Uno de los temas que siempre me ha intrigado, es la educación. He dictado muchas veces clase y he sido múltiples veces monitor donde he podido notar que en general tanto la física como las matemáticas le cuestan mucho trabajo de entender a la gente, pero que cuando existen procesos interactivos como gráficas animaciones entre otros, dicho aprendizaje se vuelve mucho más fácil. Por esta razón me gustaría desarrollar algún programa que tome alguno de los temas de física que en general sea muy abstracto y de alguna forma generar una forma de comprensión interactiva. 

#Clase 7 10-jun-2015

Hoy trabajamos en ipython. El trabajo fue crear un panel de 5x5 para poder mostrar diferentes figuras de lissajou. Para ello el código implementado, realizaba las siguientes funciones:

1. Crear 3 variables aleatorias, correspondientes a los dos valores de velocidad angular y al desfase de un movimiento oscilatorio con respecto al otro.

2. Crear una gráfica parámetrica, usando las tres variables aleatorias generadas anteriormente.

3. Almacenar el gráfico en un archivo png

El código implementado fue:

```
def correr():
    i=0
    fig=figure(figsize=(15,15))
    while(i<25):
        subplot(5,5,i+1)
        a=randint(1,9)
        b=randint(1,9)
        c=randint(1,9)
        x=linspace(0,2*pi,1000)
        plot(cos(a*x+b),cos(c*x))
        plt.axis('off')
        i=i+1
    savefig("Lissajou.png")
correr()
```

Y el resultado obtenido se muestra en la siguiente imagen:

![alt text](https://github.com/aricci10/MC/blob/master/Im%C3%A1genes/Lissajou.png "Logo Title Text 1")

#Clase 8 12-Jun-2015

Después de leer la parte de errores de libro de Landau, aprendí lo siguiente:

Lo primero, es que los errores en general se dan debido a la porpagación. Por ejemplo si se tiene un proceso, cuya probabilidad de exito es muy cercana a uno, y se corre una vez no hay problema, pero cuando se empieza a iterar el procesos esta probabilidad de exito empieza a disminuir drásticamnete hasta que al final es muy probable llegar a un fallo. Existen 4 tipos principales de errores:

+"Teoría mala": La teoría sobre la cual se está resolviendo el problema está mal planteada, ya sea un ecuación mal diseñada, un archivo con datos incorrectos, etc.

+Errores aleatorios: Son imposibles de controlar, y aumentan con el tiempo que se corra un porgrama, pueden darse debido a la electrónica del equipo usado entre otros. No son muy comunes.

+Errores de aproximación: Existen muchos métodos matemáticos cuya solución exacta es un proceso de infinitas iteraciones (ej. Series de taylor). Estos métodos se pueden resolver numéricamnete tomando un valor muy grande de iteraciones, pero es imposible realizar "infinitas" iteraciones produciendo un error.

+Errores de redondeo: Se dan debido a que existe un sin fin de números con infinitos decimales, pero computacionalmente deben trabajarse de forma finita. Estos errores inicialmente parecen insignificantes, pero al iterar múltiples veces empiezan a ser significativos.



#Clase 9 16-jun-2015

Durante esta clase trabajamos en interpolación de python. La idea fue encontrar el momento dipolar magnético de un imán con sus datos de campo magnético en función de la distancia.

Empecé por importar pylab usando:

```
%pylab inline
```

Posteriormente creé dos arreglos con los datos, y los grafiqué para observar el comportamiento

```
x=[2.3*10**(-2),2.8*10**(-2),3.2*10**(-2),3.7*10**(-2),4.3*10**(-2)]
b=[34745*10**(-6),19689*10**(-6),12594*10**(-6),7982*10**(-6),5822*10**(-6)]
scatter(x,b)
```

Teniendo en cuenta que el campo magnético es inversamente proporcional al cubo de la distancia, se linealizan los datos elevándolos al cubo e invirtiendolos de modo que:

```
i=0
resp=[]
while(i<5):
    a=x[i]**(-3)
    resp.append(a)
    i+=1
```

Ahora se realiza un ajuste lineal por mínimos cuadrados de los datos almacenados en `resp` contra el campo magnético de la siguiente forma: 

```
d,c=polyfit(resp,b,1)
equis=linspace(0,100000,100)
plot(equis,d*equis+c)
scatter(resp,b)
```

Posteriormente se encuentra el valor del momento dipolar, teniendo en cuenta que todas las constantes son la pendiente de la recta encontrada. Se realiza de la siguiente forma:

```
m=(d*2*pi)/(4*pi*10**(-7))
print("El momento dipolar es de: ",m,)
```

Finalmente usando este valor, se grafica el modelo experimental sobre los datos originales de la siguiente manera:

```
scatter(x,b)
equis2=linspace(0.02,0.06,100)
plot(equis2,(4*pi*10**(-7)*m*equis2**(-3)/(2*pi)),c='r')
```


#Clase 10 22-Jun-2015

Hoy trabajamos en transformadas de Fourier. Las usamos para limpiar una "Señal" correspondiente a las manchas solares. El código implementado fiue el siguiente:

Se inicia por importar los datos y partirlos en 3 arreglos:

```
%pylab inline
datos=genfromtxt('monthrg.dat')
Anio=datos[:,0]
Mes=datos[:,1]
Media=datos[:,3]
```

Posteriormente, se crea un arreglo final de años decimales, los cuales incluyen el mes como un decimal de año. Siguiendo se parte el arreglo, para eliminar los los años que no tienen datos o tienen datos negativos. Se grafican los datos.
```
i=0
A=[]
while(i<len(Mes)):
    temp=(Anio[i]+(Mes[i]-1)/12)
    A.append(temp)
    i+=1
MediaF=Media[3000:(len(Media)-1)]
AF=A[3000:(len(Media)-1)]
figure(figsize(12,12))
plot(AF,MediaF,lw=0.4)
xlabel("Promedio de manchas solares")
ylabel("Tiempo en Años)
title("Ciclos Solares")
```
Luego, se halla la transformada inversa, y las frecuencias de los datos. Se grafica frecuencia contra transformada.

```
from scipy.fftpack import ifft, fft, fftfreq
N=len(AF)
dt=(AF[-1]-AF[0])/N
DatF = fft(MediaF)
freq = fftfreq(N, dt)
plot(freq,np.abs(DatF),"o",label=u'DFT señal')
```

Luego, se eliminan las frecuencias menores a 0.1, para limpiar la señal y se grafican los datos iniciales y la señal filtrada.

```
figure(figsize(12,12))
freq_max =.1
DatF[np.abs(freq) > freq_max] = 0
y_cleaned=ifft(DatF)
plot(AF,y_cleaned,c='r',label="Datos")
plot(AF,MediaF,lw=0.4,label="Filtro")
legend()
title("Manchas solares(Filtrada)")
xlabel("Tiempo en años")
ylabel("Promedio de manchas solares")
```

Finalmente se halla el periodo, encontrando el índice de los valores mínimos, y restando los años evaluados en estos índices.

```
i=0
resp=[]
while(i<len(y_cleaned)-1):
    if((y_cleaned[i]<y_cleaned[i-1])and (y_cleaned[i]<y_cleaned[i+1])):
        resp.append(i)
    i+=1
periodo= AF[resp[4]]-AF[resp[3]]
print("El periodo de las manchas solares es de aproximadamente:",periodo,"años")
```


#Clase 13 1-Jul-2015

Durante la clase de hoy trabajamos en `sympy` para resolver problemas en python de forma simbólica. El ejercicio consistía en demstrar el método de Adams–Bashforth para órdenes 2,3 y 4. Se inició por importar `sympy`de la siguiente forma:

```
from sympy import *
init_printing(use_unicode=True)
```
El siguiente código muestra la implementación de orden 2. 

```
t,fn,fn1,h,tn,tn1=symbols('t fn fn1 h tn tn1')
tn1=tn-h
simplify(integrate(fn1*(t-tn)/(tn1-tn)+fn*(t-tn1)/(tn-tn1),(t,tn,tn+h)))
```

Como se observa, primero es necesario declarar las seis variables a usar como símbolos. Luego se corre la integral del polinomio de lagrange para la función. Cabe resaltar que los polinomios de lagrange son tales que el reemplazar el tiempo por un tiempo específico, se deben cancelar los términos de modo que se obtenga la función evaluada el dicho tiempo. Se muestran a continuación la implementación para orden 3 y 4.

```
t,fn,fn1,fn2,h,tn,tn1,tn2=symbols('t fn fn1 fn2 h tn tn1 tn2')
tn1=tn-h
tn2=tn-2*h
simplify(integrate(fn1*(t-tn)*(t-tn2)/((tn1-tn)*(tn1-tn2))+fn*(t-tn1)*(t-tn2)/
((tn-tn1)*(tn-tn2))+fn2*(t-tn)*(t-tn1)/((tn2-tn1)*(tn2-tn)),(t,tn,tn+h)))
```
```
t,fn,fn1,fn2,fn3,h,tn,tn1,tn2,tn3=symbols('t fn fn1 fn2 fn3 h tn tn1 tn2 tn3')
tn1=tn-h
tn2=tn-2*h
tn3=tn-3*h
simplify(integrate(fn1*(t-tn)*(t-tn2)*(t-tn3)/
((tn1-tn)*(tn1-tn2)*(tn1-tn3))+fn*(t-tn1)*(t-tn2)*(t-tn3)/
((tn-tn1)*(tn-tn2)*(tn-tn3))+fn2*(t-tn)*(t-tn1)*(t-tn3)/
((tn2-tn1)*(tn2-tn)*(tn2-tn3))+fn3*(t-tn)*(t-tn1)*(t-tn2)/
((tn3-tn1)*(tn3-tn)*(tn3-tn2)),(t,tn,tn+h)))
```

##Entrada del proyecto.
Siguiendo con la idea que llevo del proyecyo, tengo pensado crear un simulador en tres dimensiones para un fenómeno físico que no sea necesariamente fácil de abstraer. Entre las ideas que tengo se encuentran: 

+ Campos electromagnéticos.
+ Fluidos
+ Ondas electromangéticas.

La idea radica en que el usuario pueda ingrasar ciertos valores, y el programa simule el resultado, de tal modo que sea fácil visualizar el fenómeno.

##Entrada del proyecto.

Finalmente decidí que para el proyecto final quería hacer un porograma relazionado con música el cual es uno de mis hobbies. Mi idea surgió después de estudiar la transformada de Fourier. Me di cuenta que era posible separar una canción de guitarra por las frecuencias que la componían. Después pensé en darle una aplicación a esta funcionalidad, y surgió la idea de crear animaciones en una "guitarra" virtual, aplicando teoría de ondas estacionarias en cuerdas.

#Clase 16 07-Jul-2015

Para solucionar la ecuación con un extremo libre, se plantea una solución que usa una aproximación. Dado que para solucionar la ecuación se deben conocer los valores que están al lado izquierdo y derecho, pero en este caso solo hay un valor al lado izquierdo, se asumirá que el último punto tiene el mismo comportamineto que el punto que se encuentra a su izquierda. El código implementado fue:


Se inicia por declarar constantes.
```
tmin=0
tmax=.003105882
xmin=-0.33  # en metros
xmax=0.33   # en metros
Nt=1000
Nl=100
dt=(tmax-tmin)/Nt
dx=(xmax-xmin)/Nl
v=425. # m/s
r=v*dt/dx
```

Se corre posteriormente el métodos de diferencias finitas igualando el extremo libre a su posición de la izquierda

```
#fija en los extremos
xcoords=np.linspace(xmin,xmax,Nl)
tcoords=np.linspace(tmin,tmax,Nt)
chord=np.zeros((Nt,Nl))
# fijar la condición inicial
std=0.05
chord[0]=0.01*np.exp(-xcoords**2/(2*std**2))
chord[0,0]=0
chord[0,-1]=0
chord[1]=chord[0]+r**2/2.*(np.roll(chord[0],1)+np.roll(chord[0],-1)-2*chord[0])
plt.figure(figsize=(10,3))
plt.plot(xcoords,chord[0])
plt.show()
for i in range(2,Nt):
    ppchord=chord[i-2]
    pchord=chord[i-1]
    chord[i]=2*(1-r**2)*pchord-ppchord+r**2*(np.roll(pchord,1)+np.roll(pchord,-1))
    chord[i,0]=0
    chord[i,-1]=chord[i,98]
```

Finalmente se ejecuta la animación

```
fig=plt.figure(figsize=(12,1))
ax = fig.add_subplot(111, autoscale_on=False)
chordplot,=ax.plot([],[],"o",ms=2)
plt.xlim(xmin,xmax)
plt.ylim(-0.01,0.01)

time_template = 't = %.2f'
time_text = ax.text(0.5, 0.8, 'nada',transform=ax.transAxes)

def animate(i):
    chordplot.set_data(xcoords,chord[3*i])
    time_text.set_text(time_template%(i*dt*1000)+"ms")
    return chordplot,time_text

animacion = animation.FuncAnimation(fig, animate, np.arange(1,len(chord)/3),interval=1, blit=False)
animacion.save("prueba.mp4",dpi=50)
```
