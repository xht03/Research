// 只能测程序整体运行时间，无法插桩的尝试
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/time.h>
#include <time.h>
#include <sys/wait.h>

struct timeval start, middle, end;

void print_time()
{
    // 插入5个空指令
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    gettimeofday(&middle, NULL);
    long elapsed = (middle.tv_sec - start.tv_sec) * 1000000 + middle.tv_usec - start.tv_usec;
    printf("Time: %ld us\n", elapsed);
}


int main()
{
    pid_t parent_pid = getpid();
    printf("Parent process id = %d.\n", parent_pid);

    int a = 0;
    if (scanf("%d", &a) != 1) {
        fprintf(stderr, "Failed to read integer.\n");
        return EXIT_FAILURE;
    }

    char *const args[] = {"/home/keats/Avalon/Research/Work2/bin/demo", NULL};

    gettimeofday(&start, NULL);

    pid_t pid = fork();
    if(pid == 0)
    {
        
        execve("/home/keats/Avalon/Research/Work2/bin/demo", args, NULL);
        perror("execve");
        exit(EXIT_FAILURE);
    }
    else if(pid > 0)
    {
        wait(NULL);
        gettimeofday(&end, NULL);
        long total = (end.tv_sec - start.tv_sec) * 1000000 + end.tv_usec - start.tv_usec;
        printf("Total time: %ld us\n", total);

        pid_t parent_pid = getpid();
        printf("Parent process id = %d.\n", parent_pid);
        printf("Child process id = %d.\n", pid);
    }
    else
    {
        perror("fork");
        exit(EXIT_FAILURE);
    }

    return 0;
}

