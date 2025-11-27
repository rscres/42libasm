section .text
global ft_strdup

extern __errno_location
extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:
    test rdi, rdi
    jz error
    call ft_strlen
    cmp rax, 0
    jl error
    push rdi
    inc rax
    mov rdi, rax
    call malloc wrt ..plt
    cmp rax, 0
    jl error
    pop rsi
    mov rdi, rax
    call ft_strcpy
    cmp rax, 0
    jl error
    ret

error:
    neg rax
	mov rdi, rax ; syscall returned errno in rax, so we save it before overwriting it with ___error
	call __errno_location wrt ..plt
	mov [rax], edi ; rax has the address of errno, so we put the previously saved error code in [rax]
	mov rax, 0 ; write returns -1 in any error case
	ret
