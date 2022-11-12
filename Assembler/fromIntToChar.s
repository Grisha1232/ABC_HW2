	.intel_syntax noprefix
	.text
	.globl	fromIntToChar
	.type	fromIntToChar, @function
fromIntToChar:
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -4[rbp], edi		# int value
	cmp	DWORD PTR -4[rbp], 22
	je	.L2
	cmp	DWORD PTR -4[rbp], 22
	jg	.L3
	cmp	DWORD PTR -4[rbp], 21
	je	.L4
	cmp	DWORD PTR -4[rbp], 21
	jg	.L3
	cmp	DWORD PTR -4[rbp], 20
	je	.L5
	cmp	DWORD PTR -4[rbp], 20
	jg	.L3
	cmp	DWORD PTR -4[rbp], 19
	je	.L6
	cmp	DWORD PTR -4[rbp], 19
	jg	.L3
	cmp	DWORD PTR -4[rbp], 18
	je	.L7
	cmp	DWORD PTR -4[rbp], 18
	jg	.L3
	cmp	DWORD PTR -4[rbp], 17
	je	.L8
	cmp	DWORD PTR -4[rbp], 17
	jg	.L3
	cmp	DWORD PTR -4[rbp], 16
	je	.L9
	cmp	DWORD PTR -4[rbp], 16
	jg	.L3
	cmp	DWORD PTR -4[rbp], 15
	je	.L10
	cmp	DWORD PTR -4[rbp], 15
	jg	.L3
	cmp	DWORD PTR -4[rbp], 14
	je	.L11
	cmp	DWORD PTR -4[rbp], 14
	jg	.L3
	cmp	DWORD PTR -4[rbp], 13
	je	.L12
	cmp	DWORD PTR -4[rbp], 13
	jg	.L3
	cmp	DWORD PTR -4[rbp], 12
	je	.L13
	cmp	DWORD PTR -4[rbp], 12
	jg	.L3
	cmp	DWORD PTR -4[rbp], 11
	je	.L14
	cmp	DWORD PTR -4[rbp], 11
	jg	.L3
	cmp	DWORD PTR -4[rbp], 10
	je	.L15
	cmp	DWORD PTR -4[rbp], 10
	jg	.L3
	cmp	DWORD PTR -4[rbp], 9
	je	.L16
	cmp	DWORD PTR -4[rbp], 9
	jg	.L3
	cmp	DWORD PTR -4[rbp], 8
	je	.L17
	cmp	DWORD PTR -4[rbp], 8
	jg	.L3
	cmp	DWORD PTR -4[rbp], 7
	je	.L18
	cmp	DWORD PTR -4[rbp], 7
	jg	.L3
	cmp	DWORD PTR -4[rbp], 6
	je	.L19
	cmp	DWORD PTR -4[rbp], 6
	jg	.L3
	cmp	DWORD PTR -4[rbp], 5
	je	.L20
	cmp	DWORD PTR -4[rbp], 5
	jg	.L3
	cmp	DWORD PTR -4[rbp], 4
	je	.L21
	cmp	DWORD PTR -4[rbp], 4
	jg	.L3
	cmp	DWORD PTR -4[rbp], 3
	je	.L22
	cmp	DWORD PTR -4[rbp], 3
	jg	.L3
	cmp	DWORD PTR -4[rbp], 2
	je	.L23
	cmp	DWORD PTR -4[rbp], 2
	jg	.L3
	cmp	DWORD PTR -4[rbp], 0
	je	.L24
	cmp	DWORD PTR -4[rbp], 1
	je	.L25
	jmp	.L3
.L24:
	mov	eax, 33
	jmp	.L26
.L25:
	mov	eax, 34
	jmp	.L26
.L23:
	mov	eax, 39
	jmp	.L26
.L22:
	mov	eax, 40
	jmp	.L26
.L21:
	mov	eax, 41
	jmp	.L26
.L20:
	mov	eax, 44
	jmp	.L26
.L19:
	mov	eax, 45
	jmp	.L26
.L18:
	mov	eax, 46
	jmp	.L26
.L17:
	mov	eax, 47
	jmp	.L26
.L16:
	mov	eax, 58
	jmp	.L26
.L15:
	mov	eax, 59
	jmp	.L26
.L14:
	mov	eax, 60
	jmp	.L26
.L13:
	mov	eax, 62
	jmp	.L26
.L12:
	mov	eax, 63
	jmp	.L26
.L11:
	mov	eax, 91
	jmp	.L26
.L10:
	mov	eax, 92
	jmp	.L26
.L9:
	mov	eax, 93
	jmp	.L26
.L8:
	mov	eax, 94
	jmp	.L26
.L7:
	mov	eax, 95
	jmp	.L26
.L6:
	mov	eax, 96
	jmp	.L26
.L5:
	mov	eax, 123
	jmp	.L26
.L4:
	mov	eax, 124
	jmp	.L26
.L2:
	mov	eax, 125
	jmp	.L26
.L3:
	mov	eax, 0
.L26:
	pop	rbp
	ret
	.size	fromIntToChar, .-fromIntToChar
