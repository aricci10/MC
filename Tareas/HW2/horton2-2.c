
#include <stdio.h>

/*
 * TRABAJO REALIZADO POR ALFREDO RICCI Y NICOLÁS RANGEL
 */

int main(void)
{

    /*
     * Se usa scanf para recibir los datos ingresados por el usuario.
     */
   float a;
   float b;
   float c;
   float d;
 
   printf("Ingrese la altura:\n");
   printf("Pies: ");
   scanf("%f", &a);
   printf("Pulgadas: ");
   scanf("%f", &b);
   
   printf("Ingrese el ancho:\n");
   printf("Pies: ");
   scanf("%f", &c);
   printf("Pulgadas: ");
   scanf("%f", &d);
   
    /*
     * Se procesan lo datos.
     */
   
   float p1;
   float p2;
   
   p1 = a + b/12;
   p2 = c + d/12;
   float pi;
   
   pi=p1*p2*0.33333333;
   
   
   /*
   *Se imprimen los datos procesados.
   */ 

   printf("El valor del área en yardas es: %f\n", pi);


}
