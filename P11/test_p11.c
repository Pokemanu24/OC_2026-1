#include <stdio.h>

int str_len(char *str);
void str_mid(char *str_out, char *str1_in, int start, int end);
int clrBit(int value, int nbit);

int main(void)
{
    char str1[] = "Hola amigo!";
    char str2[15];
    printf("len: %d\n", str_len(str1));
    str_mid(str2, str1, 5, 9);
    printf("mid: %s\n", str2);
    int x = 10;
    printf("x: %d\n", x);
    printf("new x: %d\n", clrBit(x, 3));
    return 0;
}