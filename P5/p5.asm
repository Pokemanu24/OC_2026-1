%include "../LIB/pc_iox.inc"

section .text
    global _start

_start:
    mov EBX, 0x5C4B2A60 ; a)
    add EBX, 0x2227629
    mov EAX, EBX
    call pHex_dw
    
    mov AL, 10,
    call putchar

    push BX ; b)
    pop AX
    call pHex_w

    mov AL, 10,
    call putchar

    mov AL, BL ; c)
    mov DL, 8
    mul DL
    mov [N], AX
    call pHex_w

    mov AL, 10,
    call putchar

    inc word [N] ; d)
    mov AX, [N]
    call pHex_w

    mov AL, 10,
    call putchar

    mov AX, BX ; e)
    mov CL, 0xFF
    div CL
    call pHex_b
    mov AL, 10,
    call putchar
    mov AL, AH
    call pHex_b

    mov AL, 10,
    call putchar

    add [N], AH ; f)
    mov AX, [N]
    call pHex_w
    
    mov AL, 10,
    call putchar

    dec word [N] ; e)
    mov AX, [N]
    call pHex_w

    mov AL, 10,
    call putchar

    mov EAX, 1
	int 0x80   

section .data
N dw 0