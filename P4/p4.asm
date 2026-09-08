%include "../LIB/pc_io.inc" 

section .text
    global _start

_start:
    mov edx, msg
    call puts

    mov eax, 1
    int 0x80

section .data
    msg db "HOLA MUNDO", 10, 0
    