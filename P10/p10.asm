section .text
    global pBin8b
    global pBin16b
    global pBin32b
    global pBin64b

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

pBin8b:
    push EBP
    mov EBP, ESP
    mov DL, [EBP + 8]
    mov ECX, 8
    for_pBin8b:
        shl DL, 1
        jnc else_pBin8b ; if c == 1
            mov EAX, '1'
            call my_putchar
            jmp end_if_pBin8b
        else_pBin8b:
            mov EAX, '0'
            call my_putchar
        end_if_pBin8b:
    loop for_pBin8b
    pop EBP
    ret

pBin16b:
    push EBP
    mov EBP, ESP
    mov DX, [EBP + 8]
    mov ECX, 16
    for_pBin16b:
        shl DX, 1
        jnc else_pBin16b ; if c == 1
            mov EAX, '1'
            call my_putchar
            jmp end_if_pBin16b
        else_pBin16b:
            mov EAX, '0'
            call my_putchar
        end_if_pBin16b:
    loop for_pBin16b
    pop EBP
    ret

pBin32b:
    push EBP
    mov EBP, ESP
    mov EDX, [EBP + 8]
    mov ECX, 32
    for_pBin32b:
        shl EDX, 1
        jnc else_pBin32b ; if c == 1
            mov EAX, '1'
            call my_putchar
            jmp end_if_pBin32b
        else_pBin32b:
            mov EAX, '0'
            call my_putchar
        end_if_pBin32b:
    loop for_pBin32b
    pop EBP
    ret

pBin64b:
    push EBP
    mov EBP, ESP
    mov EBX, [EBP + 8]
    mov EDX, [EBP + 24]
    mov ECX, 64
    for_pBin64b:
        shld EDX, EBX, 1
        jnc else_pBin64b ; if c == 1
            mov EAX, '1'
            call my_putchar
            jmp end_if_pBin64b
        else_pBin64b:
            mov EAX, '0'
            call my_putchar
        end_if_pBin64b:
    loop for_pBin64b
    pop EBP
    ret