#include <stdio.h>

#define ROWS 1000
#define COLS 1000

int main() {
    int array[ROWS][COLS];

    // 初始化数组
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            array[i][j] = i * j;
        }
    }

    // 打印数组
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            printf("%d ", array[i][j]);
        }
        printf("\n");
    }

    return 0;
}