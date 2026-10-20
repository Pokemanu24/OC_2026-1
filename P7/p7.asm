%include "../LIB/pc_iox.inc"

section .data
    msg1 db ' no es menor que "m"', 10, 0
    msg2 db ' es menor que "m"', 10, 0

    msg3 db ' es letra mayuscula', 10, 0
    msg4 db ' es digito', 10, 0
    msg5 db ' no es ni digito ni letra mayuscula', 10, 0

    array times 10 db ' '

section .text
    global _start

_start:
    ; a)
    mov EDX, msg1
    call getche
    cmp AL, 'm'
    jae mayor_igual
        mov EDX, msg2
    mayor_igual:
        call puts

    mov AL, 10
    call putchar

    ; b)
    mov EDX, msg5
    call getche
    cmp AL, '0'
    jb letter
    cmp AL, '9'
    ja letter
    mov EDX, msg4
    jmp end
    letter:
        cmp AL, 'A'
        jb end
        cmp AL, 'Z'
        ja end
        mov EDX, msg3
    end: 
        call puts

    mov AL, 10
    call putchar
    
    ; c)
    mov EAX, 0
    mov EBX, 0
    mov ECX, 0
    call getche
    push AX
    mov AL, 10
    call putchar
    pop AX
    sub EAX, '0'
    mov CX, AX
    add CX, AX
    dec CX
    loop1:
        push CX
        push AX
        cmp CX, AX
        jb segunda_mitad
            inc BX
            jmp continue
        segunda_mitad:
            dec BX
        continue:
            mov CX, BX
            mov AL, '*'
            loop2:
                call putchar
            loop loop2
            mov AL, 10
            call putchar
            pop AX
            pop CX
    loop loop1

    mov AL, 10
    call putchar

    ; d)
    mov ECX, 10
    read:
        push ECX
        neg ECX
        add ECX, 10
        call getche
        mov [ECX + array], AL
        pop ECX
    loop read
    mov AL, 10
    call putchar
    mov ECX, 10
    disp:
        push ECX
        neg ECX
        add ECX, 10
        mov AL, [ECX + array]
        call putchar
        mov AL, 10
        call putchar
        pop ECX
    loop disp

    mov EAX, 1
    int 80h
    