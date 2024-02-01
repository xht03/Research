#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include <sys/mman.h>
#include <fcntl.h>

int main()
{
    char *const args[] = {"/home/keats/Avalon/Research/Work1/demo", NULL};
    execve("/home/keats/Avalon/Research/Work1/demo", args, NULL);
    return 0;
}