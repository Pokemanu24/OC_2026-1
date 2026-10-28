#include <stdio.h>

extern int suma(int x1, int x2);
extern int mystrcmp(char *str1, char *str2);
extern int mystrlen(char *str);
extern int getBit(int value, int numbit);
extern int setBit(int value, int numbit);

int main(void)
{
    printf("Inicio\n");
    printf("Suma: %d\n", suma(1, 3));
    char *str1 = "hola";
    char *str2 = "hola";
    printf("Cmp: %d\n", mystrcmp(str1, str2));
    printf("len: %d\n", mystrlen(str1));
    printf("bit: %d\n", getBit(7, 0));
    printf("set: %d\n", setBit(0, 5));
    return 0;
}