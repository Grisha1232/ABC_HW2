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
	mov	QWORD PTR -8[rbp], 0		# size_t inputLen
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
	mov	QWORD PTR -40[rbp], rdi		# char* in
	mov	QWORD PTR -48[rbp], rsi		# int resultPunct[]
	mov	rdi, QWORD PTR -40[rbp]
	lea	rsi, .LC1[rip]
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax		# fopen(in)
	mov	r13d, 0		# int count = 0
	jmp	.L3
.L4:
	mov	rdi, QWORD PTR -16[rbp]
	call	fgetc@PLT
	mov	BYTE PTR -17[rbp], al
	movsx	edi, BYTE PTR -17[rbp]
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
	add	r13d, 1
.L3:
	mov	rdi, QWORD PTR -16[rbp]
	call	feof@PLT
	test	eax, eax
	je	.L4
	mov	rdi, QWORD PTR -16[rbp]
	call	fclose@PLT
	mov	eax, r13d
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
	mov	QWORD PTR -40[rbp], rdi		# char* out
	mov	DWORD PTR -44[rbp], esi		# const int result
	mov	QWORD PTR -56[rbp], rdx		# const int resultPunct[]
	mov	rdi, QWORD PTR -40[rbp]		#
	lea	rsi, .LC2[rip]			# fopen(...)
	call	fopen@PLT			#
	mov	QWORD PTR -32[rbp], rax
	mov	edx, DWORD PTR -44[rbp]
	mov	rdi, QWORD PTR -32[rbp]
	lea	rsi, .LC3[rip]
	mov	eax, 0
	call	fprintf@PLT
	mov	r12d, 0		# int i = 0
	jmp	.L7
.L9:
	mov	eax, r12d
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	je	.L8
	mov	eax, r12d
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	ebx, DWORD PTR [rax]
	mov	edi, r12d
	call	fromIntToChar@PLT
	movsx	edx, al
	mov	rdi, QWORD PTR -32[rbp]
	mov	ecx, ebx
	lea	rsi, .LC4[rip]
	mov	eax, 0
	call	fprintf@PLT
.L8:
	add	r12d, 1
.L7:
	cmp	r12d, 22
	jle	.L9
	mov	rdi, QWORD PTR -32[rbp]
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
	mov	QWORD PTR -24[rbp], rdi		# int* result
	mov	QWORD PTR -32[rbp], rsi		# int resultPunct[]
	
	mov	edi, 0				# srand(time(NULL))
	call	time@PLT			#
	mov	edi, eax			#
	call	srand@PLT			#
	call	rand@PLT			
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	mov	DWORD PTR -8[rbp], edx		# int length = rand() % 1000
	mov	edx, DWORD PTR -8[rbp]
	imul	edx, edx, 1000
	sub	eax, edx
	mov	DWORD PTR -8[rbp], eax
	mov	esi, DWORD PTR -8[rbp]
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r12d, 0		# int i = 0;
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
	mov	BYTE PTR -9[rbp], al		# char c = rand() % 96 + 32
	movsx	edi, BYTE PTR -9[rbp]
	call	putchar@PLT
	movsx	eax, BYTE PTR -9[rbp]
	mov	edi, eax
	call	isPunctuationMark@PLT
	mov	DWORD PTR -16[rbp], eax		# int j = isPunctuationMark(c)
	cmp	DWORD PTR -16[rbp], -1		# if j != -1
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
	add	r12d, 1
.L11:
	mov	eax, r12d
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
	mov	QWORD PTR -24[rbp], rdi		# const char string[];
	mov	DWORD PTR -28[rbp], esi		# const int length;
	mov	QWORD PTR -40[rbp], rdx		# int resultPunct[];
	mov	r14d, 0				# int result = 0;
	mov	r12d, 0				# int i = 0;
	jmp	.L15
.L17:
	movsx	rdx, r12d
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -9[rbp], al		# char c = ...
	movsx	edi, BYTE PTR -9[rbp]
	call	isPunctuationMark@PLT
	mov	DWORD PTR -16[rbp], eax		# int j = isPunctuationMark(c)
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
	add	r14d, 1
.L16:
	add	r12d, 1
.L15:
	mov	eax, r12d
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
	mov	DWORD PTR -340[rbp], edi	# argc
	mov	QWORD PTR -352[rbp], rsi	# argv[]
	lea	rdi, -208[rbp]			# int PunctMark[23]
	mov	eax, 0
	mov	ecx, 11
	rep stosq
	mov	rdx, rdi
	mov	DWORD PTR [rdx], eax
	add	rdx, 4
	mov	DWORD PTR -212[rbp], 0		# int result = 0
	mov	QWORD PTR -224[rbp], 0		# char* string = Null
	mov	QWORD PTR -232[rbp], 0		# size_t length
	cmp	DWORD PTR -340[rbp], 1		# if argc == 1
	jne	.L19
	lea	rsi, -232[rbp]			# transfer length to the func
	lea	rdi, -224[rbp]			# transfer string to the func
	call	inputFromConsole
	mov	rax, QWORD PTR -232[rbp]
	cmp	rax, 1
	ja	.L20
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, -1
	jmp	.L43
.L20:
	mov	rax, QWORD PTR -232[rbp]
	sub	rax, 1
	mov	QWORD PTR -232[rbp], rax
	mov	r12d, 0				# int i = 0
	jmp	.L22
.L24:
	mov	rdx, QWORD PTR -224[rbp]	# char c
	mov	eax, r12d			# int i
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	isPunctuationMark@PLT
	mov	DWORD PTR -104[rbp], eax	# int j
	cmp	DWORD PTR -104[rbp], -1
	je	.L23
	mov	eax, DWORD PTR -104[rbp]
	cdqe
	mov	eax, DWORD PTR -208[rbp+rax*4]
	lea	edx, 1[rax]
	mov	eax, DWORD PTR -104[rbp]
	cdqe
	mov	DWORD PTR -208[rbp+rax*4], edx
	mov	eax, DWORD PTR -212[rbp]	# result++
	add	eax, 1
	mov	DWORD PTR -212[rbp], eax
.L23:
	add	r12d, 1
.L22:
	movsx	rdx, r12d
	mov	rax, QWORD PTR -232[rbp]
	cmp	rdx, rax
	jb	.L24
	mov	esi, DWORD PTR -212[rbp]
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r12d, 0				# int i = 0
	jmp	.L25
.L27:
	mov	eax, r12d
	cdqe
	mov	eax, DWORD PTR -208[rbp+rax*4]
	test	eax, eax
	je	.L26
	mov	eax, r12d
	cdqe
	mov	ebx, DWORD PTR -208[rbp+rax*4]
	mov	edi, r12d			# transfer i to the func
	call	fromIntToChar@PLT
	movsx	esi, al
	mov	edx, ebx
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
.L26:
	add	r12d, 1
.L25:
	cmp	r12d, 22
	jle	.L27
	jmp	.L28
.L19:
	cmp	DWORD PTR -340[rbp], 2		# if argc == 2
	jne	.L29
	mov	rax, QWORD PTR -352[rbp]
	add	rax, 8
	mov	rdi, QWORD PTR [rax]
	lea	rsi, .LC8[rip]
	call	strcmp@PLT
	test	eax, eax
	jne	.L30
	mov	r12, rsp
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -60[rbp], 999		# int length1 = 999
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
	mov	r12d, 0			# int i = 0
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
	mov	rdx, QWORD PTR -80[rbp]		# string1[]
	mov	eax, r12d
	cdqe
	movzx	ecx, BYTE PTR -97[rbp]
	mov	BYTE PTR [rdx+rax], cl
	movsx	eax, BYTE PTR -97[rbp]		# char c
	mov	edi, eax
	call	putchar@PLT
	add	r12d, 1				# i++
.L31:
	mov	eax, r12d			# i
	cmp	eax, DWORD PTR -60[rbp]
	jl	.L32
	call	clock@PLT
	mov	QWORD PTR -88[rbp], rax
	mov	r13d, 0		# int i = 0
	jmp	.L33
.L36:
	cmp	r13d, 799999
	je	.L34
	lea	rdx, -336[rbp]			# transfer punct[] to the func
	mov	esi, DWORD PTR -60[rbp]		# transfer length1 to the func
	mov	rdi, QWORD PTR -80[rbp]		# transfer string1[] to the func
	call	funcForTimeMeasuring
	jmp	.L35
.L34:
	lea	rdx, -208[rbp]			# transfer punctMarks[] to the func
	mov	esi, DWORD PTR -60[rbp]		# transfer length1 to the func
	mov	rdi, QWORD PTR -80[rbp]		# transfer string1[] to the func
	call	funcForTimeMeasuring
.L35:
	add	r13d, 1		# i++
.L33:
	cmp	r13d, 799999
	jle	.L36
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
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	r12d, 0		# int i = 0
	jmp	.L37
.L39:
	mov	eax, r12d		
	cdqe
	mov	eax, DWORD PTR -208[rbp+rax*4]	# punctMarks[i]
	test	eax, eax
	je	.L38
	mov	eax, r12d
	cdqe
	mov	ebx, DWORD PTR -208[rbp+rax*4]
	mov	edi, r12d
	call	fromIntToChar@PLT
	movsx	esi, al
	mov	edx, ebx
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
.L38:
	add	r12d, 1		# i++
.L37:
	cmp	r12d, 22		
	jle	.L39
	mov	eax, 0
	mov	rsp, r12
	jmp	.L43
.L30:
	lea	rsi, -208[rbp]			# transfer punctMarks to the func
	lea	rdi, -212[rbp]			# tramsfer result to the func
	call	randomInput
	mov	esi, DWORD PTR -212[rbp]
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r12d, 0		# int i = 0
	jmp	.L40
.L42:
	mov	eax, r12d
	cdqe
	mov	eax, DWORD PTR -208[rbp+rax*4]
	test	eax, eax
	je	.L41
	mov	eax, r12d
	cdqe
	mov	ebx, DWORD PTR -208[rbp+rax*4]
	mov	eax, r12d
	mov	edi, eax
	call	fromIntToChar@PLT
	movsx	eax, al
	mov	edx, ebx
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
.L41:
	add	r12d, 1
.L40:
	cmp	r12d, 22
	jle	.L42
	jmp	.L28
.L29:
	cmp	DWORD PTR -340[rbp], 3
	jne	.L28
	mov	rax, QWORD PTR -352[rbp]	# transfer argv[1] to the func
	add	rax, 8
	mov	rdi, QWORD PTR [rax]
	lea	rsi, -208[rbp]			# transfer punctMarks[] to the func
	call	inputFromFile
	mov	DWORD PTR -212[rbp], eax
	mov	esi, DWORD PTR -212[rbp]	# transfer result ot the func
	mov	rax, QWORD PTR -352[rbp]	# transfer argv[2]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, -208[rbp]			# transfer punctMarks[] to the func
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
