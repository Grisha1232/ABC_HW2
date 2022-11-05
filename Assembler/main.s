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
	mov	QWORD PTR -24[rbp], rdi			# char** string
	mov	QWORD PTR -32[rbp], rsi			# size_t length
	mov	QWORD PTR -8[rbp], 0			# size_t inputLen = 0
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rdx, QWORD PTR stdin[rip]		# 
	lea	rcx, -8[rbp]				# 
	mov	rax, QWORD PTR -24[rbp]			# calling  func getline(&*string, &inputLen, stdin)
	mov	rsi, rcx				# 
	mov	rdi, rax				# 
	call	getline@PLT				# 
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
	mov	QWORD PTR -40[rbp], rdi			# char* in
	mov	rax, QWORD PTR -40[rbp]			
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax			# FILE* input
	mov	DWORD PTR -4[rbp], 0			# int count = 0
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
	mov	QWORD PTR -24[rbp], rdi			# char* out
	mov	DWORD PTR -28[rbp], esi			# const int result
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax			# FILE* output
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
	mov	QWORD PTR -24[rbp], rdi			# int* result
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
	mov	DWORD PTR -8[rbp], eax			# int length = rand() % 1000
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0			# int i = 0
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
	mov	BYTE PTR -9[rbp], al			# char c = rand
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
	add	DWORD PTR -4[rbp], 1
.L8:
	mov	eax, DWORD PTR -4[rbp]
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
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], 0		# int result = 0;
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
	mov	DWORD PTR -12[rbp], edx		# int length = rand
	mov	edx, DWORD PTR -12[rbp]
	imul	edx, edx, 1000
	sub	eax, edx
	mov	DWORD PTR -12[rbp], eax
	mov	DWORD PTR -8[rbp], 0
	jmp	.L12
.L14:
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
	mov	BYTE PTR -13[rbp], al
	movsx	eax, BYTE PTR -13[rbp]
	mov	edi, eax
	call	isPunctuationMark@PLT
	test	eax, eax
	je	.L13
	add	DWORD PTR -4[rbp], 1
.L13:
	add	DWORD PTR -8[rbp], 1
.L12:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -12[rbp]
	jl	.L14
	nop
	nop
	leave
	ret
	.size	funcForTimeMeasuring, .-funcForTimeMeasuring
	.section	.rodata
.LC6:
	.string	"'%s'\n"
.LC7:
	.string	"Incorrect input"
.LC8:
	.string	"measuring"
	.align 8
.LC9:
	.string	"\nThe task is done 700000 times in %d ms\n"
	.align 8
.LC10:
	.string	"\nNumber of punctuation marks in string: %d"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi		# argc
	mov	QWORD PTR -80[rbp], rsi		# argv
	mov	DWORD PTR -36[rbp], 0		# int result = 0
	mov	QWORD PTR -48[rbp], 0		# char* string = NULL
	mov	QWORD PTR -56[rbp], 0		# size_t length = 0
	
	cmp	DWORD PTR -68[rbp], 1		# if argc == 1
	jne	.L18
	lea	rdx, -56[rbp]
	lea	rax, -48[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	inputFromConsole
	mov	rax, QWORD PTR -56[rbp]
	cmp	rax, 1
	ja	.L19
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, -1
	jmp	.L29
.L19:
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, 1
	mov	QWORD PTR -56[rbp], rax
	mov	DWORD PTR -8[rbp], 0
	jmp	.L21
.L23:
	mov	rdx, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	isPunctuationMark@PLT
	test	eax, eax
	je	.L22
	mov	eax, DWORD PTR -36[rbp]
	add	eax, 1
	mov	DWORD PTR -36[rbp], eax
.L22:
	add	DWORD PTR -8[rbp], 1
.L21:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -56[rbp]
	cmp	rdx, rax
	jb	.L23
	mov	eax, DWORD PTR -36[rbp]
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L24
.L18:
	cmp	DWORD PTR -68[rbp], 2		# if argc == 2
	jne	.L25
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L26
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L27
.L28:
	mov	eax, 0
	call	funcForTimeMeasuring
	add	DWORD PTR -12[rbp], 1
.L27:
	cmp	DWORD PTR -12[rbp], 699999
	jle	.L28
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -32[rbp]
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
	mov	eax, 0
	jmp	.L29
.L26:
	lea	rax, -36[rbp]
	mov	rdi, rax
	call	randomInput
	mov	eax, DWORD PTR -36[rbp]
	mov	esi, eax
	lea	rax, .LC10[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L24
.L25:
	cmp	DWORD PTR -68[rbp], 3		# if argc == 3
	jne	.L24
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	inputFromFile
	mov	DWORD PTR -36[rbp], eax
	mov	edx, DWORD PTR -36[rbp]
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	esi, edx
	mov	rdi, rax
	call	outputToFile
.L24:
	mov	eax, 0
.L29:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
