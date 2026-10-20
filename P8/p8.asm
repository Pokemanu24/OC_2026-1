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

    mov ECX, N
    mov EBX, v1
    call print_vector

    mov EAX, 1
    int 80h

scan_vector:
    for:
        call getch
        cmp EAX, 57
        ja no_digito
        cmp EAX, 48
        jb no_digito
            mov EDX, N
            sub EDX, ECX
            call putchar
            mov [EBX + EDX], AL
            jmp fin
        no_digito:
            add ECX, 1
        fin:
    loop for
    ret

print_vector:
    mov AL, '['
    call putchar
    for_print:
        mov EDX, N
        sub EDX, ECX
        mov AL, [EBX + EDX]
        call putchar
        mov AL, ','
        call putchar
    loop for_print
    mov AL, ']'
    call putchar
    ret