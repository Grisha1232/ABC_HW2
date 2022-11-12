	.file	"checkFunc.c"
	.text
	.globl	isPunctuationMark
	.type	isPunctuationMark, @function
isPunctuationMark:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	subl	$33, %eax
	cmpl	$92, %eax
	ja	.L2
	movl	%eax, %eax
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
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L24-.L4
	.long	.L23-.L4
	.long	.L22-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L21-.L4
	.long	.L20-.L4
	.long	.L19-.L4
	.long	.L18-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L17-.L4
	.long	.L16-.L4
	.long	.L15-.L4
	.long	.L2-.L4
	.long	.L14-.L4
	.long	.L13-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L12-.L4
	.long	.L11-.L4
	.long	.L10-.L4
	.long	.L9-.L4
	.long	.L8-.L4
	.long	.L7-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L6-.L4
	.long	.L5-.L4
	.long	.L3-.L4
	.text
.L26:
	movl	$0, %eax
	jmp	.L27
.L25:
	movl	$1, %eax
	jmp	.L27
.L24:
	movl	$2, %eax
	jmp	.L27
.L23:
	movl	$3, %eax
	jmp	.L27
.L22:
	movl	$4, %eax
	jmp	.L27
.L21:
	movl	$5, %eax
	jmp	.L27
.L20:
	movl	$6, %eax
	jmp	.L27
.L19:
	movl	$7, %eax
	jmp	.L27
.L18:
	movl	$8, %eax
	jmp	.L27
.L17:
	movl	$9, %eax
	jmp	.L27
.L16:
	movl	$10, %eax
	jmp	.L27
.L15:
	movl	$11, %eax
	jmp	.L27
.L14:
	movl	$12, %eax
	jmp	.L27
.L13:
	movl	$13, %eax
	jmp	.L27
.L12:
	movl	$14, %eax
	jmp	.L27
.L11:
	movl	$15, %eax
	jmp	.L27
.L10:
	movl	$16, %eax
	jmp	.L27
.L9:
	movl	$17, %eax
	jmp	.L27
.L8:
	movl	$18, %eax
	jmp	.L27
.L7:
	movl	$19, %eax
	jmp	.L27
.L6:
	movl	$20, %eax
	jmp	.L27
.L5:
	movl	$21, %eax
	jmp	.L27
.L3:
	movl	$22, %eax
	jmp	.L27
.L2:
	movl	$-1, %eax
.L27:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	isPunctuationMark, .-isPunctuationMark
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
