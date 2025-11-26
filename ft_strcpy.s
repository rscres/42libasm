section .text
global ft_strcpy

ft_strcpy:
    mov rcx, 0

.loop:
    mov al, [rsi + rcx]
    mov [rdi + rcx], al
    cmp al, 0
    je .end
    inc rcx
    jmp .loop

.end:
    mov rax, rdi
    ret
