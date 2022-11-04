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
	test	eax, eax
	je	.L3
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
	.string	"Number of punctuation marks in string: %d"
	.text
	.globl	outputToFile
	.type	outputToFile, @function
	
outputToFile:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	edx, DWORD PTR -28[rbp]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	ret
	.size	outputToFile, .-outputToFile
	.section	.rodata
.LC4:
	.string	"Result rand string: "
	.text
	.globl	randomInput
	.type	randomInput, @function
	
randomInput:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	edi, 10
	call	srand@PLT
	mov	DWORD PTR -4[rbp], 0
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1759218605
	shr	rdx, 32
	sar	edx, 12
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	mov	DWORD PTR -12[rbp], edx
	mov	edx, DWORD PTR -12[rbp]
	imul	edx, edx, 10000
	sub	eax, edx
	mov	DWORD PTR -12[rbp], eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -8[rbp], 0
	jmp	.L8
.L10:
	call	rand@PLT
	cdq
	shr	edx, 25
	add	eax, edx
	and	eax, 127
	sub	eax, edx
	mov	BYTE PTR -13[rbp], al
	movsx	eax, BYTE PTR -13[rbp]
	mov	edi, eax
	call	putchar@PLT
	movsx	eax, BYTE PTR -13[rbp]
	mov	edi, eax
	call	isPunctuationMark@PLT
	test	eax, eax
	je	.L9
	add	DWORD PTR -4[rbp], 1
.L9:
	add	DWORD PTR -8[rbp], 1
.L8:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -12[rbp]
	jl	.L10
	mov	eax, DWORD PTR -4[rbp]
	leave
	ret
	.size	randomInput, .-randomInput
	.section	.rodata
.LC5:
	.string	"Incorrect input"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	mov	DWORD PTR -8[rbp], 0
	mov	QWORD PTR -16[rbp], 0
	mov	QWORD PTR -24[rbp], 0
	cmp	DWORD PTR -36[rbp], 1
	jne	.L13
	lea	rdx, -24[rbp]
	lea	rax, -16[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	inputFromConsole
	mov	rax, QWORD PTR -24[rbp]
	cmp	rax, 1
	ja	.L14
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, -1
	jmp	.L21
.L14:
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, 1
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L16
.L18:
	mov	rdx, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	isPunctuationMark@PLT
	test	eax, eax
	je	.L17
	mov	eax, DWORD PTR -8[rbp]
	add	eax, 1
	mov	DWORD PTR -8[rbp], eax
.L17:
	add	DWORD PTR -4[rbp], 1
.L16:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	cmp	rdx, rax
	jb	.L18
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L19
.L13:
	cmp	DWORD PTR -36[rbp], 2
	jne	.L20
	lea	rax, -8[rbp]
	mov	rdi, rax
	call	randomInput
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L19
.L20:
	cmp	DWORD PTR -36[rbp], 3
	jne	.L19
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	inputFromFile
	mov	DWORD PTR -8[rbp], eax
	mov	edx, DWORD PTR -8[rbp]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	esi, edx
	mov	rdi, rax
	call	outputToFile
.L19:
	mov	eax, 0
.L21:
	leave
	ret
	.size	main, .-main
