section .text
global ft_write
extern __errno_location

ft_write:
    mov rax, 1
    ;mov rdi, rdi | fd
    ;mov rsi, rsi | buffer
    ;mov rdx, rdx | len
    syscall
    cmp rax, 0
    jnge error
    ret

error:
    neg rax
	mov rdi, rax ; syscall returned errno in rax, so we save it before overwriting it with ___error
	call __errno_location wrt ..plt ; TO CHANGE TO errno_location WHEN SUBMITTING ON LINUX
	mov [rax], edi ; rax has the address of errno, so we put the previously saved error code in [rax]
	mov rax, -1 ; write returns -1 in any error case
	ret