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

    mov ESI, 0x20D685F3  ; c)
    xor ESI, 1074012193
    mov EAX, ESI
    call pHex_dw

    mov AL, 10
    call putchar

    push ESI ; d)

    mov CH, 0xA7 ; e)
    or CH, 72
    mov AL, CH
    call pHex_b

    mov AL, 10
    call putchar

    mov BP, 0x67DA ; f)
    and BP, 0xBBAD
    mov AX, BP
    call pHex_w

    mov AL, 10
    call putchar

    shr BP, 3 ; g)
    mov AX, BP
    call pHex_w 

    mov AL, 10
    call putchar

    

    mov EAX, 1
    int 0x80