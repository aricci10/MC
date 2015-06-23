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

Y el resultado obtenido se muestra en la siguiente imagen


#Clase 8 16-jun-2015

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
```


plot(equis2,(4*pi*10**(-7)*m*equis2**(-3)/(2*pi)),c='r')

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

Finalmente, se eliminan las frecuencias menores a 0.1, para limpiar la señal y se grafican los datos iniciales y la señal filtrada.

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
