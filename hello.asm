bits 64

section .data
    msg db 'Hello, world!', 0xA
    len equ $ - msg

section .text
    global _start
_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [msg]
    mov rdx, len
    syscall

exit:
    mov rax, 60
    mov rdi, 84
    syscall
