
section .text
global pBin8b

pBin8b:
    push EBP
    mov EBP, ESP
    mov AL, [EBP + 8]
    mov ECX, 8
    for_pBin8b:
        shl AL, 1
        jnc else_pBin8b ; if c == 1
            mov EAX, 1
            call my_putchar
            jmp end_if_pBin8b
        else_pBin8b:
            mov EAX, 0
            call my_putchar
        end_if_pBin8b:
    loop for_pBin8b
    pop EBP
    ret

my_putchar:
    pushad
    push EAX
    mov EAX, 4
    mov EBX, 1
    mov ECX, ESP
    mov EDX, 1
    int 80h
    pop EAX
    popad
    ret