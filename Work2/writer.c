#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include <sys/mman.h>
#include <fcntl.h>

int main()
{
    int size = 0x2df;
    int offset = 0x10c0;  
    int fd = open("/home/keats/Avalon/Research/Work2/bin/test1", O_RDWR);
    char *addr = mmap(NULL, size + 0xc0, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x1000);

    if (fd == -1) {
        perror("open");
        return 1;
    }
    if (addr == MAP_FAILED) {
        perror("mmap");
        return 1;
    }

    // 进行插桩 offset = 0x121d - (0x1277 + 0x5) = -0x69 = 0xffffff97
    addr[0x277] = 0xe8;
    addr[0x278] = 0xa1;      
    addr[0x279] = 0xff;
    addr[0x27a] = 0xff;
    addr[0x27b] = 0xff;
    addr[0x27c] = 0x90;
    addr[0x27d] = 0x90;
    addr[0x27e] = 0x90;
    addr[0x27f] = 0x90;
    addr[0x280] = 0x90;

    // pop指令提前
    addr[0x22f] = 0x5d;  
    // 填入被牺牲的指令
    addr[0x230] = 0xc7;
    addr[0x231] = 0x85;
    addr[0x232] = 0xa0;
    addr[0x233] = 0x63;
    addr[0x234] = 0xff;
    addr[0x235] = 0xff;
    addr[0x236] = 0x00;

    addr[0x237] = 0x00;
    addr[0x238] = 0x00;
    addr[0x239] = 0x00;
    // 清空之前的pop指令
    addr[0x23e] = 0x90;     

    return 0;
}