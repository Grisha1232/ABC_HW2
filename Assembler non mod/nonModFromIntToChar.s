	.file	"fromIntToChar.c"
	.text
	.globl	fromIntToChar
	.type	fromIntToChar, @function
fromIntToChar:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)    # int value
	cmpl	$22, -4(%rbp)
	ja	.L2
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L4(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L4(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L26-.L4
	.long	.L25-.L4
	.long	.L24-.L4
	.long	.L23-.L4
	.long	.L22-.L4
	.long	.L21-.L4
	.long	.L20-.L4
	.long	.L19-.L4
	.long	.L18-.L4
	.long	.L17-.L4
	.long	.L16-.L4
	.long	.L15-.L4
	.long	.L14-.L4
	.long	.L13-.L4
	.long	.L12-.L4
	.long	.L11-.L4
	.long	.L10-.L4
	.long	.L9-.L4
	.long	.L8-.L4
	.long	.L7-.L4
	.long	.L6-.L4
	.long	.L5-.L4
	.long	.L3-.L4
	.text
.L26:
	movl	$33, %eax
	jmp	.L27
.L25:
	movl	$34, %eax
	jmp	.L27
.L24:
	movl	$39, %eax
	jmp	.L27
.L23:
	movl	$40, %eax
	jmp	.L27
.L22:
	movl	$41, %eax
	jmp	.L27
.L21:
	movl	$44, %eax
	jmp	.L27
.L20:
	movl	$45, %eax
	jmp	.L27
.L19:
	movl	$46, %eax
	jmp	.L27
.L18:
	movl	$47, %eax
	jmp	.L27
.L17:
	movl	$58, %eax
	jmp	.L27
.L16:
	movl	$59, %eax
	jmp	.L27
.L15:
	movl	$60, %eax
	jmp	.L27
.L14:
	movl	$62, %eax
	jmp	.L27
.L13:
	movl	$63, %eax
	jmp	.L27
.L12:
	movl	$91, %eax
	jmp	.L27
.L11:
	movl	$92, %eax
	jmp	.L27
.L10:
	movl	$93, %eax
	jmp	.L27
.L9:
	movl	$94, %eax
	jmp	.L27
.L8:
	movl	$95, %eax
	jmp	.L27
.L7:
	movl	$96, %eax
	jmp	.L27
.L6:
	movl	$123, %eax
	jmp	.L27
.L5:
	movl	$124, %eax
	jmp	.L27
.L3:
	movl	$125, %eax
	jmp	.L27
.L2:
	movl	$0, %eax
.L27:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fromIntToChar, .-fromIntToChar
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
