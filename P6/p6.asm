%include "../LIB/pc_iox.inc"

extern pBin_n
extern pBin_b
extern pBin_w
extern pBin_dw

section .text
    global _start

_start:
    mov EAX, 0x22446688 ; a)
    ror EAX, 4
    call pHex_dw

    mov AL, 10
    call putchar

    mov CX, 0x3F48 ; b)
    shl CX, 3
    mov AX, CX
    call pHex_w

    mov AL, 10
    call putchar

    mov ESI, 0x20D685F3 
    xor ESI, 1074012193
    mov EAX, ESI
    call pHex_dw

    mov AL, 10
    call putchar

    mov EAX, 1
    int 0x80