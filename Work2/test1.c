#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/time.h>
#include <time.h>
#include <sys/wait.h>

#define ROWS 100
#define COLS 100

void print_time()
{
    struct timeval now;
    gettimeofday(&now, NULL);
    long time = now.tv_sec * 1000000 + now.tv_usec;
    printf("Time: %ld us\n", time);
}

void trampoline()
{
    print_time();
    // 插入14个空指令
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");  
}

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