#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include <sys/mman.h>
#include <fcntl.h>

int main()
{
    int size = 0x12e;   // 302
    int size2 = 0x10;   // .data
    //int fd = open("/home/keats/Avalon/Research/Work1/bin/demo", O_RDWR);
    int fd = open("/home/keats/Avalon/Research/Work1/bin/demo_0", O_RDONLY);
    int offset = 0x1060;
    int offset2 = 0x3000;

    printf("fd = %d\n", fd);

    char *addr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0x1000);

    char *addr2 = mmap(NULL, size2, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0x3000);

    printf("addr = %p\n", addr);
    printf("addr2 = %p\n", addr2);

    if (addr == MAP_FAILED) {
        perror("mmap");
        return 1;
    }

    if(addr2 == MAP_FAILED) {
        perror("mmap2");
        return 1;
    }

    for (int i = 0; i < size; i++) {
        printf("%02x ", (unsigned char) addr[i + 0x60]);
    }
    printf("\n");
    printf("\n");

    for(int i = 0; i < size2; i++) {
        printf("%02hhx ", addr2[i]);
    }
    printf("\n");

    return 0;
}