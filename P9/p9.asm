section .text
global suma
global mystrcmp
global mystrlen
global getBit

suma:
    push EBP
    mov EBP, ESP
    mov EAX, [EBP + 8] ; EAX = x1
    add EAX, [EBP + 12] ; EAX += x2
    pop EBP
    ret

mystrcmp:
    push EBP
    mov EBP, ESP
    mov EDX, 0 ; len1 = 0
    mov ECX, 0 ; len2 = 0
    mov EAX, [EBP + 8] ; EAX = str1
    call len
    xchg EDX, ECX
    mov EAX, [EBP + 12] ; EAX = str2
    call len
    cmp EDX, ECX
    jne return_one ; len1 != len2
    mov EDX, [EBP + 8] ; EDX = str1
    while_mystrcmp: cmp byte [EDX], 0 ; while(*str1)
    je end_while_mystrcmp
        mov CL, [EDX]
        cmp CL, [EAX]
        jne return_one ; if(*str1 != *str2) return 1
        inc EDX ; str1++
        inc EAX ; str2++
    jmp while_mystrcmp
    end_while_mystrcmp:    
        mov EAX, 0
        pop EBP
        ret
    return_one:
        mov EAX, 1
        pop EBP
        ret

len:
    push EAX
    mov ECX, 0
    while_len: cmp byte [EAX], 0
    je return_len
        inc EAX ; str1++
        inc ECX ; i++
        jmp while_len
    return_len:
    pop EAX
    ret

mystrlen: ; int mystrlen(char *str1)
    push EBP
    mov EBP, ESP
    mov EAX, 0 ; int i = 0
    mov ECX, [EBP + 8] ; ECX = str1
    while_mystrlen: cmp byte [ECX], 0
    je return_mystrlen
        inc ECX ; str1++
        inc EAX ; i++
        jmp while_mystrlen
    return_mystrlen:
    pop EBP
    ret

getBit:
    push EBP
    mov EBP, ESP
    mov EAX, [EBP + 8] ; EAX = value
    mov EDX, [EBP + 12] ; EDX = numbit
    inc EDX
    shr EAX, EDX 
    lahf
    xchg AL, AH
    and EAX, 1
    pop EBP
    ret