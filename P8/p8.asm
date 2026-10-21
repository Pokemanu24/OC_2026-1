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
    mov EBX, v1
    call print_vector

    mov AL, 10
    call putchar

    mov ECX, N
    mov EBX, v2
    call scan_vector

    mov AL, 10
    call putchar

    mov ECX, N
    mov EBX, v2
    call print_vector

    mov AL, 10
    call putchar

    mov EBX, v1
    mov EDX, v2
    mov ECX, N
    call sum_vectors

    mov EBX, v1
    mov ECX, N
    call print_vector

    mov AL, 10
    call putchar

    mov ECX, N
    mov EBX, v1
    mov EDX, v2
    call dot

    mov EBX, v1
    mov ECX, N
    call print_vector

    mov AL, 10
    call putchar

    mov EAX, 1
    int 80h

scan_vector:
    for:
        call getch
        cmp EAX, 57
        ja no_digito
        cmp EAX, 48
        jb no_digito
            call putchar
            sub AL, '0'
            mov [EBX], AL
            inc EBX
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
        mov AL, [EBX]
        call pHex_b
        mov AL, ','
        call putchar
        inc EBX
    loop for_print
    mov AL, ']'
    call putchar
    ret

sum_vectors:
    for_sum:
        mov AL, [EBX]
        add AL, [EDX]
        mov [EBX], AL
        inc EBX
        inc EDX
    loop for_sum
    ret

dot:
    for_dot:
        mov AL, [EBX]
        mul byte[EDX]
        mov [EBX], AL
        inc EBX
        inc EDX
    loop for_dot
    ret
