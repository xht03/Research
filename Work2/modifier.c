#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <libelf.h>
#include <gelf.h>
#include <string.h>
#include <sys/mman.h>
#include <dis-asm.h>

#define MAX_BYTES 16    // 一条指令最多包含的字节数

int text_offset = 0;
int text_size = 0;


struct Instruction {
    int offset;
    int length;
    unsigned char *bytes;
    char *mnemonic;
    char *op_str;
};

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


void diser(int argc, char **argv)
{

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

    disassemble_info info;
    // 初始化反汇编信息结构
    init_disassemble_info (&info, stdout, (fprintf_ftype) fprintf);
    info.arch = bfd_arch_i386;                  // 设置架构为i386
    info.mach = bfd_mach_x86_64;                // 设置机器类型为x86-64
    info.endian = BFD_ENDIAN_LITTLE;            // 设置字节序为小端
    info.fprintf_func = (fprintf_ftype) fprintf;// 设置打印函数
    //info.print_address_func = print_insn;       // 设置打印地址函数
    info.buffer = code + (text_offset - start);
    info.buffer_length = length;


    // 定义反汇编器函数类型
    disassembler_ftype disassemble;
        
    bfd abfd;
    // 获取一个适合的目标架构
    // 初始化二进制文件描述符
    abfd.arch_info = bfd_lookup_arch (info.arch, info.mach);
    if (bfd_set_default_target("elf64-x86-64") == 0) {
        printf("bfd_set_default_target failed\n");
        exit(1);
    }

    // 创建反汇编器
    disassemble = disassembler (info.arch, info.mach, info.endian, &abfd);


    bfd_vma pc = 0;
    int i = 0;
    while (pc < text_size) {
        //for(int i = 0; i < disassemble (pc, &info); i++)
        //{
        //    printf("%02x ", code[pc + i]);
        //}
        printf("PC = 0x%lx, Len = %x\n", pc, disassemble (pc, &info));
        pc += disassemble (pc, &info);
        i++;
    }

}

int main(int argc, char **argv) {

    reader(argc, argv);
    diser(argc, argv);

    return 0;
}