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
	movq	%rdi, -24(%rbp)		# char** string
	movq	%rsi, -32(%rbp)		# size_t* length
	movq	$0, -8(%rbp)		# size_t inputLen = 0
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
	movq	%rdi, -40(%rbp)		# char* in
	movq	%rsi, -48(%rbp)		# int resultPunct[]
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
	movl	%eax, -24(%rbp)
	cmpl	$-1, -24(%rbp)
	je	.L3
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
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
	.string	"Number of punctuation marks in string: %d\n"
.LC4:
	.string	"%c -- %d\n"
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
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)		# char* out
	movl	%esi, -44(%rbp)		# const int result
	movq	%rdx, -56(%rbp)		# const int resultPunct[]
	movq	-40(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -32(%rbp)
	movl	-44(%rbp), %edx
	movq	-32(%rbp), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, -20(%rbp)
	jmp	.L7
.L9:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L8
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ebx
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	fromIntToChar@PLT
	movsbl	%al, %edx
	movq	-32(%rbp), %rax
	movl	%ebx, %ecx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L8:
	addl	$1, -20(%rbp)
.L7:
	cmpl	$22, -20(%rbp)
	jle	.L9
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	outputToFile, .-outputToFile
	.section	.rodata
.LC5:
	.string	"Length of the string: %d\n"
.LC6:
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
	movq	%rdi, -24(%rbp)		# int* result
	movq	%rsi, -32(%rbp)		# int resultPunct[]
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
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -4(%rbp)
	jmp	.L11
.L13:
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
	movl	%eax, -16(%rbp)
	cmpl	$-1, -16(%rbp)
	je	.L12
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L12:
	addl	$1, -4(%rbp)
.L11:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L13
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	randomInput, .-randomInput
	.globl	funcForTimeMeasuring
	.type	funcForTimeMeasuring, @function
funcForTimeMeasuring:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)		# const char string[]
	movl	%esi, -28(%rbp)		# const int length
	movq	%rdx, -40(%rbp)		# int resultPunct[]
	movl	$0, -4(%rbp)		# int result = 0;
	movl	$0, -8(%rbp)		# int i = 0;
	jmp	.L15
.L17:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	movsbl	-9(%rbp), %eax
	movl	%eax, %edi
	call	isPunctuationMark@PLT
	movl	%eax, -16(%rbp)
	cmpl	$-1, -16(%rbp)
	je	.L16
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	addl	$1, -4(%rbp)
.L16:
	addl	$1, -8(%rbp)
.L15:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L17
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	funcForTimeMeasuring, .-funcForTimeMeasuring
	.section	.rodata
.LC7:
	.string	"Incorrect input"
.LC8:
	.string	"measuring"
	.align 8
.LC9:
	.string	"\nThe task is done 800000 times in %d ms\n"
	.align 8
.LC10:
	.string	"\nNumber of punctuation marks in string: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$336, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movl	%edi, -340(%rbp)	# argc
	movq	%rsi, -352(%rbp)	# argv[]
	leaq	-208(%rbp), %rdx	# punctMarks[]
	movl	$0, %eax
	movl	$11, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	movl	$0, -212(%rbp)		# int result = 0;
	movq	$0, -224(%rbp)		# char* strin = NULL
	movq	$0, -232(%rbp)		# size_t length = 0;
	cmpl	$1, -340(%rbp)		# if argc == 1
	jne	.L19
	leaq	-232(%rbp), %rdx
	leaq	-224(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	inputFromConsole
	movq	-232(%rbp), %rax
	cmpq	$1, %rax
	ja	.L20
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L43
.L20:
	movq	-232(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -232(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L22
.L24:
	movq	-224(%rbp), %rdx
	movl	-36(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	isPunctuationMark@PLT
	movl	%eax, -104(%rbp)
	cmpl	$-1, -104(%rbp)
	je	.L23
	movl	-104(%rbp), %eax
	cltq
	movl	-208(%rbp,%rax,4), %eax
	leal	1(%rax), %edx
	movl	-104(%rbp), %eax
	cltq
	movl	%edx, -208(%rbp,%rax,4)
	movl	-212(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -212(%rbp)
.L23:
	addl	$1, -36(%rbp)
.L22:
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-232(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L24
	movl	-212(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -40(%rbp)
	jmp	.L25
.L27:
	movl	-40(%rbp), %eax
	cltq
	movl	-208(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L26
	movl	-40(%rbp), %eax
	cltq
	movl	-208(%rbp,%rax,4), %ebx
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	fromIntToChar@PLT
	movsbl	%al, %eax
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L26:
	addl	$1, -40(%rbp)
.L25:
	cmpl	$22, -40(%rbp)
	jle	.L27
	jmp	.L28
.L19:
	cmpl	$2, -340(%rbp)		# if argc == 2
	jne	.L29
	movq	-352(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L30
	movq	%rsp, %rax
	movq	%rax, %r12
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$999, -60(%rbp)
	movl	-60(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -72(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -368(%rbp)
	movq	$0, -360(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	cltq
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -80(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -44(%rbp)
	jmp	.L31
.L32:
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
	movb	%al, -97(%rbp)
	movq	-80(%rbp), %rdx
	movl	-44(%rbp), %eax
	cltq
	movzbl	-97(%rbp), %ecx
	movb	%cl, (%rdx,%rax)
	movsbl	-97(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	addl	$1, -44(%rbp)
.L31:
	movl	-44(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L32
	call	clock@PLT
	movq	%rax, -88(%rbp)
	movl	$0, -48(%rbp)
	jmp	.L33
.L36:
	cmpl	$799999, -48(%rbp)
	je	.L34
	leaq	-336(%rbp), %rdx
	movl	-60(%rbp), %ecx
	movq	-80(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	funcForTimeMeasuring
	jmp	.L35
.L34:
	leaq	-208(%rbp), %rdx
	movl	-60(%rbp), %ecx
	movq	-80(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	funcForTimeMeasuring
.L35:
	addl	$1, -48(%rbp)
.L33:
	cmpl	$799999, -48(%rbp)
	jle	.L36
	call	clock@PLT
	movq	%rax, -96(%rbp)
	movq	-88(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	difftime@PLT
	cvttsd2sil	%xmm0, %eax
	movslq	%eax, %rdx
	imulq	$274877907, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$6, %edx
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -52(%rbp)
	jmp	.L37
.L39:
	movl	-52(%rbp), %eax
	cltq
	movl	-208(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L38
	movl	-52(%rbp), %eax
	cltq
	movl	-208(%rbp,%rax,4), %ebx
	movl	-52(%rbp), %eax
	movl	%eax, %edi
	call	fromIntToChar@PLT
	movsbl	%al, %eax
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L38:
	addl	$1, -52(%rbp)
.L37:
	cmpl	$22, -52(%rbp)
	jle	.L39
	movl	$0, %eax
	movq	%r12, %rsp
	jmp	.L43
.L30:
	leaq	-208(%rbp), %rdx
	leaq	-212(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	randomInput
	movl	-212(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -56(%rbp)
	jmp	.L40
.L42:
	movl	-56(%rbp), %eax
	cltq
	movl	-208(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L41
	movl	-56(%rbp), %eax
	cltq
	movl	-208(%rbp,%rax,4), %ebx
	movl	-56(%rbp), %eax
	movl	%eax, %edi
	call	fromIntToChar@PLT
	movsbl	%al, %eax
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L41:
	addl	$1, -56(%rbp)
.L40:
	cmpl	$22, -56(%rbp)
	jle	.L42
	jmp	.L28
.L29:
	cmpl	$3, -340(%rbp)		# if argc == 3
	jne	.L28
	movq	-352(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-208(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	inputFromFile
	movl	%eax, -212(%rbp)
	movl	-212(%rbp), %ecx
	movq	-352(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-208(%rbp), %rdx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	outputToFile
.L28:
	movl	$0, %eax
.L43:
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
