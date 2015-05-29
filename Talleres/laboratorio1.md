#Postre de limón

El siguiente documento tiene como objetivo presentar la lista de mercado y receta para poder crear un postre de limón.

## Lista de ingredientes:

Los ingredientes necesarios para poder crear un postre de limón son:

+ **8** Limones
+ **10** Galletas *Macarena*
+ **1 Lata** de Crema de leche
+ **1 Lata**de Leche condensada
+ Crema Chantilly

## Preparación del postre

Para poder preparar el postre usted debe:

1. Exprimir los 8 limones en una taza.
2. Vertir la crema de leche y leche condenzada en una licuadora
3. Vertir el jugo de limón en la licuadora
4. Licuar hasta conseguir la consistencia deseada.
5. Aplastar las galletas y colocarlas en un recipiente.
6. Vertir la mezcla en el recipiente y enfriar.
9. Colocar la crema chantilly sobre el postre.

También es posible crear el postre en iPython con el siguiente código:

```
Limones = 8
Galletas = 10
JugoLimon=0

def exprimir():
    Limones=Limones-1
    JugoLimon=JugoLimon+1

while(JugoLimon<8):
    exprimir()
```

Como se observa en el código, la linea `while(JugoLimon<8)` Sirve para hacer jugo hasta que se acaben los limones. El siguiente link contiene una imagen del postre:


[Postre Limón](http://www.cocinasemana.com/recetas/receta/postre-de-limon/21213)

## Para el punto 3 de la tarea se usó el siguiente código:

```
awk -F"," '{print(($1+$2))}' cuadrados.csv >> cuadradosSumados.csv
```