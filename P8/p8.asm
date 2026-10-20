%include "../LIB/pc_iox.inc"

N equ 5

section .bss
    v1 resb N
    v2 resb N

section .text
    global _start

_start:
    mov ECX, N
    mov EBX, v1
    call scan_vector

    mov AL, 10
    call putchar

    mov ECX, N
    mov EBX, v2
    call scan_vector

    mov AL, 10
    call putchar
    
    mov EAX, 1
    int 80h

scan_vector:
    for:
        push ECX
        neg ECX
        add ECX, N
        call getche
        mov [EBX + ECX], AL
        pop ECX
    loop for
    ret