#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <libelf.h>
#include <gelf.h>
#include <string.h>
#include <inttypes.h>
#include <capstone/capstone.h>
#include <sys/mman.h>

#define MAX_BYTES 16    // 一条指令最多包含的字节数

int text_offset = 0;
int text_size = 0;

void reader(int argc, char **argv)
{
    Elf *elf;   // ELF文件的句柄
    Elf_Scn *scn = NULL;    // 节的句柄
    GElf_Shdr shdr;     // 节头表
    char *name;     // 节的名字
    int fd;    // 文件描述符
    size_t shstrndx;    // 节头字符串表的索引

    // 检查命令行参数个数
    if (argc != 2) {
        printf("Usage format: %s <elf-file>\n", argv[0]);
        exit(1);
    }

    // 初始化libelf库
    if (elf_version(EV_CURRENT) == EV_NONE) {
        printf("ELF library initialization failed: %s\n", elf_errmsg(-1));
        exit(1);
    }

    // 打开ELF文件
    fd = open(argv[1], O_RDONLY);
    if (fd < 0) {
        perror("open");
        exit(1);
    }

    // 获取ELF文件的句柄
    elf = elf_begin(fd, ELF_C_READ, NULL);
    if (elf == NULL) {
        printf("elf_begin() failed: %s\n", elf_errmsg(-1));
        exit(1);
    }

    // 获取字符串表的索引
    if (elf_getshdrstrndx(elf, &shstrndx) != 0) {
        printf("elf_getshdrstrndx() failed: %s\n", elf_errmsg(-1));
        exit(1);
    }

    // 遍历所有的节
    while ((scn = elf_nextscn(elf, scn)) != NULL) {
        // 获取节区头部信息
        if (gelf_getshdr(scn, &shdr) != &shdr) {
            printf("getshdr() failed: %s\n", elf_errmsg(-1));
            exit(1);
        }

        // 获取节区名称
        name = elf_strptr(elf, shstrndx, shdr.sh_name);
        if (name == NULL) {
            printf("elf_strptr() failed: %s\n", elf_errmsg(-1));
            exit(1);
        }

        // 如果是.text节区，打印其开始地址、大小
        if (strcmp(name, ".text") == 0) {
            text_offset = shdr.sh_offset;
            text_size = shdr.sh_size;   
            printf(".text section start address: 0x%" PRIx64 "\n", shdr.sh_addr);
            printf(".text section size: 0x%" PRIx64 "\n", shdr.sh_size);
            break;
        }
    }

    // 结束对ELF文件的处理，关闭文件
    elf_end(elf);
    close(fd);

}


void disassembler(int argc, char **argv)
{
    csh handle;  // Capstone库的句柄
    cs_insn *insn;  // 存储反汇编结果的数组
    size_t count;  // 反汇编出的指令数量

    int start = (text_offset/0x1000) * 0x1000;
    int length = text_size + (text_offset - start);

    // 打开文件
    int fd = open(argv[1], O_RDWR);
    if (fd == -1) {
        perror("open");
        exit(1);
    }

    // 映射文件到内存
    unsigned char *code = mmap(NULL, length, PROT_READ | PROT_WRITE, MAP_SHARED, fd, start);
    if (code == MAP_FAILED) {
        perror("mmap");
        exit(1);
    }

    // 打开Capstone库的句柄，设置架构为x86，模式为64位
     if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK)
        exit(1);
    
    // 进行反汇编，结果存储在insn数组中，返回反汇编出的指令数量
    count = cs_disasm(handle, code + (text_offset - start), sizeof(code) - (text_offset - start), text_offset, 0, &insn);

    if (count > 0) {
        size_t j;
        // 遍历每条反汇编出的指令
        for (j = 0; j < count; j++) {
            printf("0x%"PRIx64":\t", insn[j].address);

            // 打印原始的机器码
            for (int k = 0; k < MAX_BYTES; k++) {
                if (k < insn[j].size) {
                    printf("%02x ", insn[j].bytes[k]);
                }
                else printf("   ");  // 用三个空格填充
            }
            
            printf("%s\t%s\n", insn[j].mnemonic, insn[j].op_str);   // 打印助记符、操作数
        }

        // 释放存储反汇编结果的数组
        //cs_free(insn, count);
    }
    else printf("ERROR: Failed to disassemble given code!\n");

    // 关闭Capstone库的句柄
    cs_close(&handle);

}

int main(int argc, char **argv) {

    reader(argc, argv);
    disassembler(argc, argv);

    return 0;
}
