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
	movb	%al, -4(%rbp)		# Variable char c
	movsbl	-4(%rbp), %eax
	cmpl	$125, %eax
	jg	.L2
	cmpl	$123, %eax
	jge	.L3
	cmpl	$63, %eax
	jg	.L4
	cmpl	$33, %eax
	jl	.L2
	movl	%eax, %edx
	movabsq	$-2593805628514238464, %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	andl	$1, %eax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L3
	jmp	.L2
.L4:
	subl	$91, %eax
	cmpl	$5, %eax
	ja	.L2
.L3:
	movl	$1, %eax
	jmp	.L5
.L2:
	movl	$0, %eax
.L5:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	isPunctuationMark, .-isPunctuationMark
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
