#include <stdio.h>
#include <inttypes.h>
#include <capstone/capstone.h>

int main() {
    csh handle;  // Capstone库的句柄
    cs_insn *insn;  // 存储反汇编结果的数组
    size_t count;  // 反汇编出的指令数量

    // 将机器码存储在字符数组中
    unsigned char code[] = {0x55, 0x48, 0x8b, 0x05, 0xb8, 0x13, 0x00, 0x00};

    // 打开Capstone库的句柄，设置架构为x86，模式为64位
    if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK)
        return -1;

    // 进行反汇编，结果存储在insn数组中，返回反汇编出的指令数量
    count = cs_disasm(handle, code, sizeof(code), 0x1000, 0, &insn);
    if (count > 0) {
        size_t j;
        // 遍历每条反汇编出的指令
        for (j = 0; j < count; j++) {
            printf("0x%"PRIx64":\t", insn[j].address);

            // 打印原始的机器码
            for (int k = 0; k < insn[j].size; k++) {
                printf("%02x ", insn[j].bytes[k]);
            }

            printf("\t%s\t\t%s\n", insn[j].mnemonic, insn[j].op_str);
        }

        // 释放存储反汇编结果的数组
        cs_free(insn, count);
    } else
        printf("ERROR: Failed to disassemble given code!\n");

    // 关闭Capstone库的句柄
    cs_close(&handle);

    return 0;
}
    