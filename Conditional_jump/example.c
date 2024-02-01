#include<stdio.h>

int main() {
    int grade = 65;
    if (grade <= 60) {			// 这里写错了，需要修改成 >= 60及格
        printf("pass\n");
    } else {
        printf("fail\n");
    }
    return 0;
}
