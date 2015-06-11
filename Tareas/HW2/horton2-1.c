
#include <stdio.h>

/*
 * TRABAJO REALIZADO POR ALFREDO RICCI Y NICOLÁS RANGEL
 */

int main(void)
{

    /*
     * Se usa scanf para recibir, es necesario usar dar el formato de lo que se recibe.
     */
   float a;
 
   printf("Ingrese el valor en pulgadas: ");
   scanf("%f", &a);
   float p;
   float pi;
   /*
   *Se realizan los cálculos pertinentes y se imprimen en líneas separadas.
   */ 
   p=0.027777778*a;
   pi=0.083333333*a;
   printf("El valor en yardas es: %f\n", p);
   printf("El valor en pies es: %f\n", pi);
   printf("El valor en pulgadas es: %f\n", a);

}


