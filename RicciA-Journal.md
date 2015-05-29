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


