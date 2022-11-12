	.intel_syntax noprefix
	.text
	.globl	isPunctuationMark
	.type	isPunctuationMark, @function
isPunctuationMark:
	push	rbp
	mov	rbp, rsp
	mov	eax, edi
	mov	BYTE PTR -4[rbp], al		# char c
	movsx	eax, BYTE PTR -4[rbp]
	cmp	eax, 125
	je	.L2
	cmp	eax, 125
	jg	.L3
	cmp	eax, 124
	je	.L4
	cmp	eax, 124
	jg	.L3
	cmp	eax, 123
	je	.L5
	cmp	eax, 123
	jg	.L3
	cmp	eax, 96
	je	.L6
	cmp	eax, 96
	jg	.L3
	cmp	eax, 95
	je	.L7
	cmp	eax, 95
	jg	.L3
	cmp	eax, 94
	je	.L8
	cmp	eax, 94
	jg	.L3
	cmp	eax, 93
	je	.L9
	cmp	eax, 93
	jg	.L3
	cmp	eax, 92
	je	.L10
	cmp	eax, 92
	jg	.L3
	cmp	eax, 91
	je	.L11
	cmp	eax, 91
	jg	.L3
	cmp	eax, 63
	je	.L12
	cmp	eax, 63
	jg	.L3
	cmp	eax, 62
	je	.L13
	cmp	eax, 62
	jg	.L3
	cmp	eax, 60
	je	.L14
	cmp	eax, 60
	jg	.L3
	cmp	eax, 59
	je	.L15
	cmp	eax, 59
	jg	.L3
	cmp	eax, 58
	je	.L16
	cmp	eax, 58
	jg	.L3
	cmp	eax, 47
	je	.L17
	cmp	eax, 47
	jg	.L3
	cmp	eax, 46
	je	.L18
	cmp	eax, 46
	jg	.L3
	cmp	eax, 45
	je	.L19
	cmp	eax, 45
	jg	.L3
	cmp	eax, 44
	je	.L20
	cmp	eax, 44
	jg	.L3
	cmp	eax, 41
	je	.L21
	cmp	eax, 41
	jg	.L3
	cmp	eax, 40
	je	.L22
	cmp	eax, 40
	jg	.L3
	cmp	eax, 39
	je	.L23
	cmp	eax, 39
	jg	.L3
	cmp	eax, 33
	je	.L24
	cmp	eax, 34
	je	.L25
	jmp	.L3
.L24:
	mov	eax, 0
	jmp	.L26
.L25:
	mov	eax, 1
	jmp	.L26
.L23:
	mov	eax, 2
	jmp	.L26
.L22:
	mov	eax, 3
	jmp	.L26
.L21:
	mov	eax, 4
	jmp	.L26
.L20:
	mov	eax, 5
	jmp	.L26
.L19:
	mov	eax, 6
	jmp	.L26
.L18:
	mov	eax, 7
	jmp	.L26
.L17:
	mov	eax, 8
	jmp	.L26
.L16:
	mov	eax, 9
	jmp	.L26
.L15:
	mov	eax, 10
	jmp	.L26
.L14:
	mov	eax, 11
	jmp	.L26
.L13:
	mov	eax, 12
	jmp	.L26
.L12:
	mov	eax, 13
	jmp	.L26
.L11:
	mov	eax, 14
	jmp	.L26
.L10:
	mov	eax, 15
	jmp	.L26
.L9:
	mov	eax, 16
	jmp	.L26
.L8:
	mov	eax, 17
	jmp	.L26
.L7:
	mov	eax, 18
	jmp	.L26
.L6:
	mov	eax, 19
	jmp	.L26
.L5:
	mov	eax, 20
	jmp	.L26
.L4:
	mov	eax, 21
	jmp	.L26
.L2:
	mov	eax, 22
	jmp	.L26
.L3:
	mov	eax, -1
.L26:
	pop	rbp
	ret
	.size	isPunctuationMark, .-isPunctuationMark
