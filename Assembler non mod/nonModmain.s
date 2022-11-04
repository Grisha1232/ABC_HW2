	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"Type string: "
	.text
	.globl	inputFromConsole
	.type	inputFromConsole, @function
inputFromConsole:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	leaq	-8(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getline@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	inputFromConsole, .-inputFromConsole
	.section	.rodata
.LC1:
	.string	"r"
	.text
	.globl	inputFromFile
	.type	inputFromFile, @function
inputFromFile:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L3
.L4:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -17(%rbp)
	movsbl	-17(%rbp), %eax
	movl	%eax, %edi
	call	isPunctuationMark@PLT
	testl	%eax, %eax
	je	.L3
	addl	$1, -4(%rbp)
.L3:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	feof@PLT
	testl	%eax, %eax
	je	.L4
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	inputFromFile, .-inputFromFile
	.section	.rodata
.LC2:
	.string	"w"
	.align 8
.LC3:
	.string	"Number of punctuation marks in string: %d"
	.text
	.globl	outputToFile
	.type	outputToFile, @function
outputToFile:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	outputToFile, .-outputToFile
	.section	.rodata
.LC4:
	.string	"Length of the string: %d"
.LC5:
	.string	"Result rand string: "
	.text
	.globl	randomInput
	.type	randomInput, @function
randomInput:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$274877907, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$6, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, -8(%rbp)
	movl	-8(%rbp), %edx
	imull	$1000, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -4(%rbp)
	jmp	.L8
.L10:
	call	rand@PLT
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	sarl	$4, %eax
	movl	%edx, %esi
	sarl	$31, %esi
	subl	%esi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	sall	$5, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$32, %eax
	movb	%al, -9(%rbp)
	movsbl	-9(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	movsbl	-9(%rbp), %eax
	movl	%eax, %edi
	call	isPunctuationMark@PLT
	testl	%eax, %eax
	je	.L9
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L9:
	addl	$1, -4(%rbp)
.L8:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L10
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	randomInput, .-randomInput
	.section	.rodata
.LC6:
	.string	"Incorrect input"
	.align 8
.LC7:
	.string	"\nNumber of punctuation marks in string: %d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)		# argc
	movq	%rsi, -48(%rbp)		# argv
	movl	$0, -8(%rbp)		# int result = 0
	movq	$0, -16(%rbp)		# char* string = NULL
	movq	$0, -24(%rbp)		# size_t length = 0
	cmpl	$1, -36(%rbp)
	jne	.L12
	leaq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	inputFromConsole
	movq	-24(%rbp), %rax
	cmpq	$1, %rax
	ja	.L13
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L20
.L13:
	movq	-24(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L15
.L17:
	movq	-16(%rbp), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	isPunctuationMark@PLT
	testl	%eax, %eax
	je	.L16
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
.L16:
	addl	$1, -4(%rbp)
.L15:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L17
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L18
.L12:
	cmpl	$2, -36(%rbp)
	jne	.L19
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	randomInput
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L18
.L19:
	cmpl	$3, -36(%rbp)
	jne	.L18
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	inputFromFile
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edx
	movq	-48(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	outputToFile
.L18:
	movl	$0, %eax
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
