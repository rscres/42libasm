section .text
global ft_strcmp

ft_strcmp:
    mov rcx, 0
    mov rax, 0

loop:
    mov al, byte [rsi + rcx]
    mov dl, byte [rdi + rcx]
    cmp al, dl
    jne not_equal
    test al, al
    je end
    inc rcx
    jmp loop

not_equal:
    sub dl, al
    movsx rax, dl
    ret

end:
    mov rax, 0
    ret

