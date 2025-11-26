section .text
global ft_strlen

ft_strlen:
    mov rcx, 0

.loop:
    cmp byte [rdi + rcx], 0
    je .end
    inc rcx
    jmp .loop

.end:
    mov rax, rcx
    ret
