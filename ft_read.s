section .text
global ft_read
extern __errno_location

ft_read:
    mov rax, 0
    syscall
    cmp rax, 0
    jl error
    ret

error:
    neg rax
	mov rdi, rax ; syscall returned errno in rax, so we save it before overwriting it with ___error
	call __errno_location wrt ..plt 
	mov [rax], edi ; rax has the address of errno, so we put the previously saved error code in [rax]
	mov rax, -1
	ret
