%include "../LIB/pc_iox.inc"

section .data
    msg1 db ' no es menor que "m"', 10, 0
    msg2 db ' es menor que "m"', 10, 0

    msg3 db ' es letra', 10, 0
    msg4 db ' es numero', 10, 0
    msg5 db ' no es ni digito ni letra mayuscula', 10, 0

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
    call getche
    mov DL, AL ; \
    sub DL, 48 ; > [48, 57]
    cmp DL, 10 ; /
    jb number
    mov DL, AL ; \ 
    sub DL, 65 ;  > [65, 90]
    cmp DL, 26 ; /
    jb letter
    mov EDX, msg5
    jmp end
    number:
        mov EDX, msg4
        jmp end
    letter:
        mov EDX, msg3
    end: 
        call puts

    mov EAX, 1
    int 80h
    