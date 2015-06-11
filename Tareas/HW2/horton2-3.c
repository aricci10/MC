
#include <stdio.h>

/*
 * TRABAJO REALIZADO POR ALFREDO RICCI Y NICOLÁS RANGEL
 */

int main(void)
{

    /*
     * Se reciben los datos ingresados por el usuario.
     */
   float a;
   float d;
 
   printf("Ingrese el tipo de producto: ");
   scanf("%f", &a);
   
   printf("Ingrese la cantidad del producto: ");
   scanf("%f", &d);
   
   float p1;
   float p2;
   
    /*
     * Se procesan los datos.
     */
   
   p1 = (1.5+ 2*a)*d;
   
   
   /*
   *Se imprimen los datos procesados.
   */ 

   printf("El valor total a pagar es: %f\n", p1);


}
