	.file	"checkFunc.c"
	.intel_syntax noprefix
	.text
	.globl	isPunctuationMark
	.type	isPunctuationMark, @function
isPunctuationMark:
	push	rbp
	mov	rbp, rsp
	mov	eax, edi
	mov	BYTE PTR -4[rbp], al
	movsx	eax, BYTE PTR -4[rbp]
	cmp	eax, 125
	jg	.L2
	cmp	eax, 123
	jge	.L3
	cmp	eax, 63
	jg	.L4
	cmp	eax, 33
	jl	.L2
	mov	edx, eax
	movabs	rax, -2593805628514238464
	mov	ecx, edx
	shr	rax, cl
	and	eax, 1
	test	rax, rax
	setne	al
	test	al, al
	jne	.L3
	jmp	.L2
.L4:
	sub	eax, 91
	cmp	eax, 5
	ja	.L2
.L3:
	mov	eax, 1
	jmp	.L5
.L2:
	mov	eax, 0
.L5:
	pop	rbp
	ret
	.size	isPunctuationMark, .-isPunctuationMark
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
