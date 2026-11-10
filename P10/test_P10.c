#include <stdio.h>
#include <stdint.h>

void pBin8b(uint8_t x);
void pBin16b(uint16_t x);
void pBin32b(uint32_t x);
void pBin64b(uint64_t x);

int main()
{
    pBin8b(7);
    printf("\n");
    pBin16b(1203);
    printf("\n");
    pBin32b(5024);
    printf("\n");
    pBin64b(1244563);
    printf("\n");
    return 0;
}