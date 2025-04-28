# PARALLELISM HOMEWORK  


**FULL NAME:** GUESSOUM MOHAMED NIZAR.  
**GROUP:** 05.  


----
## EXEMPLE 01
```C
#include <omp.h>
#include <stdio.h>
int main () {
 #pragma omp parallel
 {// Création de threads (processus légers)
 int ID = omp_get_thread_num ();
 printf("Hello(%d)", ID);
 printf ("world(%d)\n", ID);
 }//Destruction de threads
 }
```
> - commenting the result:
>    - we are seeing hello and world with a number after each one repeating 8 times
> - exxplanation:
>   - according to the code it creates possible threads that the pc has and then for every thread it gives an id then display it next to hello and world, because i have 4 cores with 2 threads for each the execution shows 8 lines of hello worls.

## EXEMPLE 02
```C
#include <omp.h>
#include <stdio.h>
void main () {
 #pragma omp parallel num_threads (10)
 {// Création de threads (processus légers)
 int ID = omp_get_thread_num ();
 printf("Hello(%d)", ID);
 printf ("world(%d)\n", ID);
 }//Destruction de threads
 }
```
> - commenting the result:
>    - the execution shows 10 hello worlds with the id of the thread created (we cerated 10 threads), the order o lines is not sequential because they are running in parellel and system shuldule does not guarante the order.
## EXEMPLE 03
```C
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <omp.h>
void main() {
omp_set_num_threads(2) ;
int a = 10, b = 20, c = 30 ;
 #pragma omp parallel private (a)
 {
 printf(" %d \n", a + 1) ;
 }
 #pragma omp parallel firstprivate (b)
 {
 b=b + 1;
 printf(" %d \n", b ) ;
 }
 #pragma omp parallel shared (c)
 {

 printf(" %d \n", c ) ;
 }
}
```
> - explanation of the directives :
>   - private: Each thread gets a copy, and it's uninitialized unless explicitly initialized (so it have unexpected value).
>   - firstprivate: Each thread gets a copy, and it's initialized with the value from the master thread.
>   - shared: All threads access the same memory location.
> - commenting the result:
>   - private directive : each thread(we have two) gets a copy but it doesnt use the value of the master thread which is 10, so the result of a will be unexpected and have a strange value for my exemple : 21918, 32675.
>   - firstprivate : each thread get a copy and be inisialised with the value in master thread which is 20 , so the result will be 20 + 1 for both threads.
>   - shared : both threads use the same variable so the result will be 30 for both.
## EXEMPLE 4.1
```C
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <omp.h>
int main() {
 const int DIM = 1000;
 int i,j,k;
 double debut, fin, temps;
 double **a, **b, **cresu, **ctest;
 a= (double**) malloc(DIM*sizeof(double*));
 b= (double**) malloc(DIM*sizeof(double*));
 cresu= (double**) malloc(DIM*sizeof(double*));
 ctest= (double**) malloc(DIM*sizeof(double*));
 // initialisations etc...
 for (i=0; i<DIM; i++)
 {
 a[i]=(double*) malloc(DIM*sizeof(double));
 b[i]=(double*) malloc(DIM*sizeof(double));
 cresu[i]=(double*) malloc(DIM*sizeof(double));
 ctest[i]=(double*) malloc(DIM*sizeof(double));
 for (j = 0; j < DIM; j++)
 {
 a[i][j] = (double)(i-j);
 b[i][j] = (double)(i+j);
 cresu[i][j] = 0.0;
 ctest[i][j] = 0.0;
 }
 } // Multiplication C = A x B (séquentiel)
 printf("Multiplication sequentielle:\n");
 debut= omp_get_wtime();
 for (i = 0; i < DIM; i++)
 for (j = 0; j < DIM; j++)
 for (k = 0; k < DIM; k++)
 ctest[i][j] += a[i][k] * b[k][j];
 fin= omp_get_wtime();
 temps=fin-debut;
 printf ("Calcul séquentiel %f secondes\n", temps);
 // Multiplication C = A x B (parallèle)
 return (0);
 }
```
- this is the execution time for the sequential multiplication of the matrixes :
## EXEMPLE 4.2
```c
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <omp.h>

int main() {
  const int DIM = 1000;
  int i, j, k;
  double debut, fin, temps;
  double **a, **b, **cresu, **ctest;

  a = (double**) malloc(DIM * sizeof(double*));
  b = (double**) malloc(DIM * sizeof(double*));
  cresu = (double**) malloc(DIM * sizeof(double*));
  ctest = (double**) malloc(DIM * sizeof(double*));

  // Initialisation
  for (i = 0; i < DIM; i++) {
    a[i] = (double*) malloc(DIM * sizeof(double));
    b[i] = (double*) malloc(DIM * sizeof(double));
    cresu[i] = (double*) malloc(DIM * sizeof(double));
    ctest[i] = (double*) malloc(DIM * sizeof(double));

    for (j = 0; j < DIM; j++) {
      a[i][j] = (double)(i - j);
      b[i][j] = (double)(i + j);
      cresu[i][j] = 0.0;
      ctest[i][j] = 0.0;
    }
  }

  printf("Multiplication parallèle:\n");
  debut = omp_get_wtime();

  // Corrected OpenMP parallel region
  #pragma omp parallel for private(i, j, k) schedule(static) num_threads(4)
  for (i = 0; i < DIM; i++) {
    for (j = 0; j < DIM; j++) {
      for (k = 0; k < DIM; k++) {
        ctest[i][j] += a[i][k] * b[k][j];
      }
    }
  }

  fin = omp_get_wtime();
  temps = fin - debut;
  printf("Calcul parallèle %f secondes\n", temps);

  return 0;
}
```
- this is the execution time for the parallel multiplication of the matrixes :
