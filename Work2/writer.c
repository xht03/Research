// 原始的插桩程序
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

    // 进行插桩
    // offset = 0x11a9 - 0x127c = -0xd3
    addr[0x277] = 0xe8;
    addr[0x278] = 0x2d;
    addr[0x279] = 0xff;
    addr[0x27a] = 0xff;
    addr[0x27b] = 0xff;
    // offset = 0x121d - 0x127e = -0x61
    addr[0x27c] = 0xeb;
    addr[0x27d] = 0x9f;

    addr[0x27e] = 0x90;
    addr[0x27f] = 0x90;
    addr[0x280] = 0x90;

/*
    // 把trampoline清空，获取更大的空地
    for(int i = 0x21d; i <= 0x23f; i++)
    {
        addr[i] = 0x90;
    }
*/   
    // 填入被牺牲的指令
    addr[0x21d] = 0xc7;
    addr[0x21e] = 0x85;
    addr[0x21f] = 0xa0;
    addr[0x220] = 0x63;
    addr[0x221] = 0xff;
    addr[0x222] = 0xff;
    addr[0x223] = 0x00;

    addr[0x224] = 0x00;
    addr[0x225] = 0x00;
    addr[0x226] = 0x00;
    // 跳转回原来的代码
    // offset = 0x1281 - 0x1229 = 0x58
    addr[0x227] = 0xeb;
    addr[0x228] = 0x58;


    // 进行第二次插桩
    // offset = 0x11a9 - 0x12f8 = -0x14f
    addr[0x2f3] = 0xe8;
    addr[0x2f4] = 0xb1;
    addr[0x2f5] = 0xfe;
    addr[0x2f6] = 0xff;
    addr[0x2f7] = 0xff;
    // offset = 0x1229 - 0x12fd = -0xd4
    addr[0x2f8] = 0xe9;
    addr[0x2f9] = 0x2c;
    addr[0x2fa] = 0xff;
    addr[0x2fb] = 0xff;
    addr[0x2fc] = 0xff;
   
    // 填入被牺牲的指令
    addr[0x229] = 0xc7;
    addr[0x22a] = 0x85;
    addr[0x22b] = 0xa0;
    addr[0x22c] = 0x63;
    addr[0x22d] = 0xff;
    addr[0x22e] = 0xff;
    addr[0x22f] = 0x00;

    addr[0x230] = 0x00;
    addr[0x231] = 0x00;
    addr[0x232] = 0x00;
    // 跳转回原来的代码
    // offset = 0x12fd - 0x1238 = 0xc5
    addr[0x233] = 0xe9;
    addr[0x234] = 0xc5;
    addr[0x235] = 0x00;
    addr[0x236] = 0x00; 
    addr[0x237] = 0x00;
    
    return 0;
}