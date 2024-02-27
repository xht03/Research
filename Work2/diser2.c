#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <libelf.h>
#include <gelf.h>
#include <string.h>
#include <sys/mman.h>
#include <dis-asm.h>

// 自定义的打印地址函数
static void print_insn (bfd_vma memaddr, disassemble_info *info) {
    // 在输出流中打印地址
    fprintf (info->stream, "0x%08lx:\t", memaddr);
}

int main() {

    // 定义一段硬编码的机器码
    unsigned char code[] = {0x55, 0x48, 0x8b, 0x05, 0xb8, 0x13, 0x00, 0x00};

    disassemble_info info;
    
    // 初始化反汇编信息结构
    init_disassemble_info (&info, stdout, (fprintf_ftype) fprintf);
    info.arch = bfd_arch_i386;                  // 设置架构为i386
    info.mach = bfd_mach_x86_64;                // 设置机器类型为x86-64
    info.endian = BFD_ENDIAN_LITTLE;            // 设置字节序为小端
    info.fprintf_func = (fprintf_ftype) fprintf;// 设置打印函数
    info.print_address_func = print_insn;       // 设置打印地址函数
    info.buffer = code;
    info.buffer_length = sizeof(code);


    // 定义反汇编器函数类型
    disassembler_ftype disassemble;
        
    bfd abfd;

    // 初始化二进制文件描述符
    abfd.arch_info = bfd_lookup_arch (info.arch, info.mach);
    if (bfd_set_default_target("elf64-x86-64") == 0) {
    printf("bfd_set_default_target failed\n");
    exit(1);
}

    // 创建反汇编器
    disassemble = disassembler (info.arch, info.mach, info.endian, &abfd);
    // 使用反汇编器反汇编机器码
    disassemble ((bfd_vma) 0, &info);

    return 0;
}