%include "../LIB/pc_iox.inc"

section .data
    msg1 db ' no es menor que "m"', 10, 0
    msg2 db ' es menor que "m"', 10, 0

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
    call putschar

    ; b)
    call getche
    cmp AL, 90
    jnbe end

    end




    mov EAX, 1
    int 80h
    