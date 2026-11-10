section .text
    global str_len
    global str_mid

str_len:
    push EBP
    mov EBP, ESP
    mov EDX, [EBP + 8]
    mov EAX, 0
    while_str_len: cmp byte [EDX], 0
    je endwhile_str_len
        inc EDX
        inc EAX
    jmp while_str_len
    endwhile_str_len:
    pop EBP
    ret

str_mid:
    push EBP
    mov EBP, ESP
    push EBX
    mov ECX, [EBP + 20] ; ECX = end
    sub ECX, [EBP + 16] ; ECX = end - start
    cmp ECX, 0
    jb return_str_mid

    mov EDX, [EBP + 12] ; EDX = *str_in
    push EDX
    call str_len
    cmp EAX, [EBP + 16] ;
    jb return_str_mid ; if (str_in.len < start)

    mov EDX, [EDX + EAX] ; EDX = *(str_in + start) 
    mov EAX, [EBP + 8] ; EAX = *str_out
    for_str_mid:
        mov BL, [EDX]
        mov [EAX], BL
        inc EDX
        inc EAX
        cmp EDX, 0
        je return_str_mid
    loop for_str_mid
    return_str_mid:
        mov byte [EAX], 0
        pop EBX
        pop EBP
        ret