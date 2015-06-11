
#include <stdio.h>
#include <math.h>

/*
 * TRABAJO REALIZADO POR ALFREDO RICCI Y NICOLÁS RANGEL
 */

int main(void)
{

   float a;
   float d;
     
     /*
     * Se usa scanf para recibir los valores .
     */
 
   printf("Ingrese su pago semanal: ");
   scanf("%f", &a);
   
   printf("Ingrese la cantidad de horas trabajadas: ");
   scanf("%f", &d);
   
     /*
     * Se procesan los datos recibidos.
     */
 

   int p1;
   p1 = a/d;
   
   double p2;
   p2=a/d;
	

	int e;
   e = (p2-p1)*100;
   
   /*
   *Se imprimen los datos.
   */ 

 printf("El pago por hora es de %d dólares y %d centavos\n ", p1, e);


}
