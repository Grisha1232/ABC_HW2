	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Type string: "
	.text
	.globl	inputFromConsole
	.type	inputFromConsole, @function
inputFromConsole:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -8[rbp], 0
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rdx, QWORD PTR stdin[rip]
	lea	rcx, -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	getline@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR [rax], rdx
	nop
	leave
	ret
	.size	inputFromConsole, .-inputFromConsole
	.section	.rodata
.LC1:
	.string	"r"
	.text
	.globl	inputFromFile
	.type	inputFromFile, @function
inputFromFile:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -48[rbp], rsi
	mov	rax, QWORD PTR -40[rbp]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L3
.L4:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	BYTE PTR -17[rbp], al
	movsx	eax, BYTE PTR -17[rbp]
	mov	edi, eax
	call	isPunctuationMark@PLT
	mov	DWORD PTR -24[rbp], eax
	cmp	DWORD PTR -24[rbp], -1
	je	.L3
	mov	eax, DWORD PTR -24[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	add	edx, 1
	mov	DWORD PTR [rax], edx
	add	DWORD PTR -4[rbp], 1
.L3:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	feof@PLT
	test	eax, eax
	je	.L4
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, DWORD PTR -4[rbp]
	leave
	ret
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
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 56
	mov	QWORD PTR -40[rbp], rdi
	mov	DWORD PTR -44[rbp], esi
	mov	QWORD PTR -56[rbp], rdx
	mov	rax, QWORD PTR -40[rbp]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	edx, DWORD PTR -44[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	DWORD PTR -20[rbp], 0
	jmp	.L7
.L9:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	je	.L8
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	ebx, DWORD PTR [rax]
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, eax
	call	fromIntToChar@PLT
	movsx	edx, al
	mov	rax, QWORD PTR -32[rbp]
	mov	ecx, ebx
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L8:
	add	DWORD PTR -20[rbp], 1
.L7:
	cmp	DWORD PTR -20[rbp], 22
	jle	.L9
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
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
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	mov	DWORD PTR -8[rbp], edx
	mov	edx, DWORD PTR -8[rbp]
	imul	edx, edx, 1000
	sub	eax, edx
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L11
.L13:
	call	rand@PLT
	mov	edx, eax
	movsx	rax, edx
	imul	rax, rax, 715827883
	shr	rax, 32
	sar	eax, 4
	mov	esi, edx
	sar	esi, 31
	sub	eax, esi
	mov	ecx, eax
	mov	eax, ecx
	add	eax, eax
	add	eax, ecx
	sal	eax, 5
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	add	eax, 32
	mov	BYTE PTR -9[rbp], al
	movsx	eax, BYTE PTR -9[rbp]
	mov	edi, eax
	call	putchar@PLT
	movsx	eax, BYTE PTR -9[rbp]
	mov	edi, eax
	call	isPunctuationMark@PLT
	mov	DWORD PTR -16[rbp], eax
	cmp	DWORD PTR -16[rbp], -1
	je	.L12
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	add	edx, 1
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
.L12:
	add	DWORD PTR -4[rbp], 1
.L11:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jl	.L13
	nop
	nop
	leave
	ret
	.size	randomInput, .-randomInput
	.globl	funcForTimeMeasuring
	.type	funcForTimeMeasuring, @function
funcForTimeMeasuring:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	QWORD PTR -40[rbp], rdx
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	jmp	.L15
.L17:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -9[rbp], al
	movsx	eax, BYTE PTR -9[rbp]
	mov	edi, eax
	call	isPunctuationMark@PLT
	mov	DWORD PTR -16[rbp], eax
	cmp	DWORD PTR -16[rbp], -1
	je	.L16
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	add	edx, 1
	mov	DWORD PTR [rax], edx
	add	DWORD PTR -4[rbp], 1
.L16:
	add	DWORD PTR -8[rbp], 1
.L15:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L17
	nop
	nop
	leave
	ret
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
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r12
	push	rbx
	sub	rsp, 336
	mov	DWORD PTR -340[rbp], edi
	mov	QWORD PTR -352[rbp], rsi
	lea	rdx, -208[rbp]
	mov	eax, 0
	mov	ecx, 11
	mov	rdi, rdx
	rep stosq
	mov	rdx, rdi
	mov	DWORD PTR [rdx], eax
	add	rdx, 4
	mov	DWORD PTR -212[rbp], 0
	mov	QWORD PTR -224[rbp], 0
	mov	QWORD PTR -232[rbp], 0
	cmp	DWORD PTR -340[rbp], 1
	jne	.L19
	lea	rdx, -232[rbp]
	lea	rax, -224[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	inputFromConsole
	mov	rax, QWORD PTR -232[rbp]
	cmp	rax, 1
	ja	.L20
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, -1
	jmp	.L43
.L20:
	mov	rax, QWORD PTR -232[rbp]
	sub	rax, 1
	mov	QWORD PTR -232[rbp], rax
	mov	DWORD PTR -36[rbp], 0
	jmp	.L22
.L24:
	mov	rdx, QWORD PTR -224[rbp]
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	isPunctuationMark@PLT
	mov	DWORD PTR -104[rbp], eax
	cmp	DWORD PTR -104[rbp], -1
	je	.L23
	mov	eax, DWORD PTR -104[rbp]
	cdqe
	mov	eax, DWORD PTR -208[rbp+rax*4]
	lea	edx, 1[rax]
	mov	eax, DWORD PTR -104[rbp]
	cdqe
	mov	DWORD PTR -208[rbp+rax*4], edx
	mov	eax, DWORD PTR -212[rbp]
	add	eax, 1
	mov	DWORD PTR -212[rbp], eax
.L23:
	add	DWORD PTR -36[rbp], 1
.L22:
	mov	eax, DWORD PTR -36[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -232[rbp]
	cmp	rdx, rax
	jb	.L24
	mov	eax, DWORD PTR -212[rbp]
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -40[rbp], 0
	jmp	.L25
.L27:
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	mov	eax, DWORD PTR -208[rbp+rax*4]
	test	eax, eax
	je	.L26
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	mov	ebx, DWORD PTR -208[rbp+rax*4]
	mov	eax, DWORD PTR -40[rbp]
	mov	edi, eax
	call	fromIntToChar@PLT
	movsx	eax, al
	mov	edx, ebx
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L26:
	add	DWORD PTR -40[rbp], 1
.L25:
	cmp	DWORD PTR -40[rbp], 22
	jle	.L27
	jmp	.L28
.L19:
	cmp	DWORD PTR -340[rbp], 2
	jne	.L29
	mov	rax, QWORD PTR -352[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L30
	mov	rax, rsp
	mov	r12, rax
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -60[rbp], 999
	mov	eax, DWORD PTR -60[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -72[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -368[rbp], rdx
	mov	QWORD PTR -360[rbp], 0
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	cdqe
	mov	edx, 16
	sub	rdx, 1
	add	rax, rdx
	mov	ebx, 16
	mov	edx, 0
	div	rbx
	imul	rax, rax, 16
	sub	rsp, rax
	mov	rax, rsp
	add	rax, 0
	mov	QWORD PTR -80[rbp], rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -44[rbp], 0
	jmp	.L31
.L32:
	call	rand@PLT
	mov	edx, eax
	movsx	rax, edx
	imul	rax, rax, 715827883
	shr	rax, 32
	sar	eax, 4
	mov	esi, edx
	sar	esi, 31
	sub	eax, esi
	mov	ecx, eax
	mov	eax, ecx
	add	eax, eax
	add	eax, ecx
	sal	eax, 5
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	add	eax, 32
	mov	BYTE PTR -97[rbp], al
	mov	rdx, QWORD PTR -80[rbp]
	mov	eax, DWORD PTR -44[rbp]
	cdqe
	movzx	ecx, BYTE PTR -97[rbp]
	mov	BYTE PTR [rdx+rax], cl
	movsx	eax, BYTE PTR -97[rbp]
	mov	edi, eax
	call	putchar@PLT
	add	DWORD PTR -44[rbp], 1
.L31:
	mov	eax, DWORD PTR -44[rbp]
	cmp	eax, DWORD PTR -60[rbp]
	jl	.L32
	call	clock@PLT
	mov	QWORD PTR -88[rbp], rax
	mov	DWORD PTR -48[rbp], 0
	jmp	.L33
.L36:
	cmp	DWORD PTR -48[rbp], 799999
	je	.L34
	lea	rdx, -336[rbp]
	mov	ecx, DWORD PTR -60[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	funcForTimeMeasuring
	jmp	.L35
.L34:
	lea	rdx, -208[rbp]
	mov	ecx, DWORD PTR -60[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	funcForTimeMeasuring
.L35:
	add	DWORD PTR -48[rbp], 1
.L33:
	cmp	DWORD PTR -48[rbp], 799999
	jle	.L36
	call	clock@PLT
	mov	QWORD PTR -96[rbp], rax
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -96[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	mov	ecx, eax
	mov	eax, edx
	sub	eax, ecx
	mov	esi, eax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -52[rbp], 0
	jmp	.L37
.L39:
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	mov	eax, DWORD PTR -208[rbp+rax*4]
	test	eax, eax
	je	.L38
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	mov	ebx, DWORD PTR -208[rbp+rax*4]
	mov	eax, DWORD PTR -52[rbp]
	mov	edi, eax
	call	fromIntToChar@PLT
	movsx	eax, al
	mov	edx, ebx
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L38:
	add	DWORD PTR -52[rbp], 1
.L37:
	cmp	DWORD PTR -52[rbp], 22
	jle	.L39
	mov	eax, 0
	mov	rsp, r12
	jmp	.L43
.L30:
	lea	rdx, -208[rbp]
	lea	rax, -212[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	randomInput
	mov	eax, DWORD PTR -212[rbp]
	mov	esi, eax
	lea	rax, .LC10[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -56[rbp], 0
	jmp	.L40
.L42:
	mov	eax, DWORD PTR -56[rbp]
	cdqe
	mov	eax, DWORD PTR -208[rbp+rax*4]
	test	eax, eax
	je	.L41
	mov	eax, DWORD PTR -56[rbp]
	cdqe
	mov	ebx, DWORD PTR -208[rbp+rax*4]
	mov	eax, DWORD PTR -56[rbp]
	mov	edi, eax
	call	fromIntToChar@PLT
	movsx	eax, al
	mov	edx, ebx
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L41:
	add	DWORD PTR -56[rbp], 1
.L40:
	cmp	DWORD PTR -56[rbp], 22
	jle	.L42
	jmp	.L28
.L29:
	cmp	DWORD PTR -340[rbp], 3
	jne	.L28
	mov	rax, QWORD PTR -352[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, -208[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	inputFromFile
	mov	DWORD PTR -212[rbp], eax
	mov	ecx, DWORD PTR -212[rbp]
	mov	rax, QWORD PTR -352[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, -208[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	outputToFile
.L28:
	mov	eax, 0
.L43:
	lea	rsp, -32[rbp]
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
