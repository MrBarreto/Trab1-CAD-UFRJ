#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    int n;
    int* result;
    int* vec;
    int* result2;
    clock_t begin, end;
    double total_time;
    srand(time(NULL));
    int r = rand()%201;
    
    printf("Entre com a dimensão da matriz: \n");
    scanf("%i", &n);
    int** matriz = (int**)malloc(n * sizeof(int*));
        for (int i = 0; i < n; i++)
            matriz[i] = (int*)malloc(n * sizeof(int));

    vec = (int*)malloc(n * sizeof(int));
    result = (int*)malloc(n * sizeof(int*));
    result2 = (int*)malloc(n * sizeof(int*));
    for (int i = 0; i < n; ++i) {
        for(int j = 0; j < n; ++j) {
            matriz[i][j] = r;
        }
        vec[i] = r;
    }
    begin = clock();
    for (int i = 0; i < n; i++){
        for (int j =0; j < n; j++ ){
            result[i] += matriz[i][j]*vec[j];
        }
    }
    end = clock();
    total_time = (double)(end-begin)/CLOCKS_PER_SEC;
    printf("O tempo decorrido percorrendo por linhas foi de %f segundo(s)\n", total_time);
    
    begin = clock();
    for (int i = 0; i < n; i++){
        for (int j =0; j < n; j++ ){
            result2[j] += matriz[j][i]*vec[i];
        }
    }
    end = clock();
    total_time = (double)(end-begin)/CLOCKS_PER_SEC;
    printf("O tempo decorrido percorrendo por colunas foi de %f segundo(s)\n", total_time);
}