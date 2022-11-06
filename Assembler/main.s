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
	mov	QWORD PTR -24[rbp], rdi		# char** string
	mov	QWORD PTR -32[rbp], rsi		# size_t* length
	mov	QWORD PTR -8[rbp], 0		# size_t inputLen = 0
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rdx, QWORD PTR stdin[rip]
	lea	rsi, -8[rbp]
	mov	rdi, QWORD PTR -24[rbp]
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
	mov	QWORD PTR -40[rbp], rdi		# char* in
	mov	rdi, QWORD PTR -40[rbp]
	lea	rsi, .LC1[rip]
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax		# FILE* input
	mov	r12d, 0				# int count = 0
	jmp	.L3
.L4:
	mov	rdi, QWORD PTR -16[rbp]
	call	fgetc@PLT
	mov	BYTE PTR -17[rbp], al
	movsx	edi, BYTE PTR -17[rbp]
	call	isPunctuationMark@PLT
	test	eax, eax
	je	.L3
	add	r12d, 1
.L3:
	mov	rdi, QWORD PTR -16[rbp]
	call	feof@PLT
	test	eax, eax
	je	.L4
	mov	rdi, QWORD PTR -16[rbp]
	call	fclose@PLT
	mov	eax, r12d
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
	mov	QWORD PTR -24[rbp], rdi		#char* out
	mov	DWORD PTR -28[rbp], esi		# const int result
	mov	rdi, QWORD PTR -24[rbp]
	lea	rsi, .LC2[rip]
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax		# FILE* output
	mov	edx, DWORD PTR -28[rbp]
	mov	rdi, QWORD PTR -8[rbp]
	lea	rsi, .LC3[rip]
	mov	eax, 0
	call	fprintf@PLT
	mov	rdi, QWORD PTR -8[rbp]
	call	fclose@PLT
	nop
	leave
	ret
	.size	outputToFile, .-outputToFile
	.section	.rodata
.LC4:
	.string	"Length of the string: %d\n"
.LC5:
	.string	"Result rand string: "
	.text
	.globl	randomInput
	.type	randomInput, @function
randomInput:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi		#int* result
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
	mov	DWORD PTR -8[rbp], eax		# int length = rand
	mov	esi, DWORD PTR -8[rbp]
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r12d, 0
	jmp	.L8
.L10:
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
	test	eax, eax
	je	.L9
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
.L9:
	add	r12d, 1
.L8:
	mov	eax, r12d
	cmp	eax, DWORD PTR -8[rbp]
	jl	.L10
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
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi		# const char string[]
	mov	DWORD PTR -28[rbp], esi		# const int length
	mov	r12d, 0				# int result = 0
	mov	DWORD PTR -8[rbp], 0		# int i = 0
	jmp	.L12
.L14:
	movsx	rdx, DWORD PTR -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -9[rbp], al
	movsx	edi, BYTE PTR -9[rbp]
	call	isPunctuationMark@PLT
	test	eax, eax
	je	.L13
	add	r12d, 1
.L13:
	add	DWORD PTR -8[rbp], 1
.L12:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L14
	nop
	nop
	leave
	ret
	.size	funcForTimeMeasuring, .-funcForTimeMeasuring
	.section	.rodata
.LC6:
	.string	"Incorrect input"
.LC7:
	.string	"measuring"
	.align 8
.LC8:
	.string	"\nThe task is done 800000 times in %d ms\n"
	.align 8
.LC9:
	.string	"\nNumber of punctuation marks in string: %d"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 104
	mov	DWORD PTR -132[rbp], edi	# argc
	mov	QWORD PTR -144[rbp], rsi	# argv
	mov	DWORD PTR -104[rbp], 0		# int result = 0
	mov	QWORD PTR -112[rbp], 0		# char* string = NULL
	mov	QWORD PTR -120[rbp], 0		# size_t length = 0
	cmp	DWORD PTR -132[rbp], 1		# if argc == 1
	jne	.L16
	lea	rsi, -120[rbp]
	lea	rdi, -112[rbp]
	call	inputFromConsole
	mov	rax, QWORD PTR -120[rbp]
	cmp	rax, 1
	ja	.L17
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, -1
	jmp	.L29
.L17:
	mov	rax, QWORD PTR -120[rbp]
	sub	rax, 1
	mov	QWORD PTR -120[rbp], rax
	mov	DWORD PTR -52[rbp], 0
	jmp	.L19
.L21:
	mov	rdx, QWORD PTR -112[rbp]
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	isPunctuationMark@PLT
	test	eax, eax
	je	.L20
	mov	eax, DWORD PTR -104[rbp]
	add	eax, 1
	mov	DWORD PTR -104[rbp], eax
.L20:
	add	DWORD PTR -52[rbp], 1
.L19:
	movsx	rdx, DWORD PTR -52[rbp]
	mov	rax, QWORD PTR -120[rbp]
	cmp	rdx, rax
	jb	.L21
	mov	esi, DWORD PTR -104[rbp]
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L22
.L16:
	cmp	DWORD PTR -132[rbp], 2
	jne	.L23
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 8
	mov	rdi, QWORD PTR [rax]
	lea	rsi, .LC7[rip]
	call	strcmp@PLT
	test	eax, eax
	jne	.L24
	mov	rax, rsp
	mov	rbx, rax
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -64[rbp], 999
	mov	eax, DWORD PTR -64[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -72[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	mov	edx, 16
	sub	rdx, 1
	add	rax, rdx
	mov	ecx, 16
	mov	edx, 0
	div	rcx
	imul	rax, rax, 16
	sub	rsp, rax
	mov	rax, rsp
	add	rax, 0
	mov	QWORD PTR -80[rbp], rax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -56[rbp], 0
	jmp	.L25
.L26:
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
	mov	eax, DWORD PTR -56[rbp]
	cdqe
	movzx	ecx, BYTE PTR -97[rbp]
	mov	BYTE PTR [rdx+rax], cl
	movsx	edi, BYTE PTR -97[rbp]
	call	putchar@PLT
	add	DWORD PTR -56[rbp], 1
.L25:
	mov	eax, DWORD PTR -56[rbp]
	cmp	eax, DWORD PTR -64[rbp]
	jl	.L26
	call	clock@PLT
	mov	QWORD PTR -88[rbp], rax
	mov	DWORD PTR -60[rbp], 0
	jmp	.L27
.L28:
	mov	esi, DWORD PTR -64[rbp]
	mov	rdi, QWORD PTR -80[rbp]
	call	funcForTimeMeasuring
	add	DWORD PTR -60[rbp], 1
.L27:
	cmp	DWORD PTR -60[rbp], 799999
	jle	.L28
	call	clock@PLT
	mov	QWORD PTR -96[rbp], rax
	mov	rsi, QWORD PTR -88[rbp]
	mov	rdi, QWORD PTR -96[rbp]
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
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	mov	rsp, rbx
	jmp	.L29
.L24:
	lea	rdi, -104[rbp]
	call	randomInput
	mov	esi, DWORD PTR -104[rbp]
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L22
.L23:
	cmp	DWORD PTR -132[rbp], 3
	jne	.L22
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 8
	mov	rdi, QWORD PTR [rax]
	call	inputFromFile
	mov	DWORD PTR -104[rbp], eax
	mov	esi, DWORD PTR -104[rbp]
	mov	rdi, QWORD PTR -144[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	call	outputToFile
.L22:
	mov	eax, 0
.L29:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
