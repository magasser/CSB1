; Version:	1.0
; Author:	Gasser Manuel
; Date:		22.10.2018

SECTION .data
	x	dq	2
	exp	dq	3
SECTION .bss

SECTION .text

global _start

_start:
	mov	RAX, [x]
	mov	RCX, [x]
	mov	RBX, [exp]
loop:
	mul	RCX
	dec	RBX
	jz	Exit
	jmp	loop

Exit:
	mov	RAX, 60
	mov	RSI, 0
	syscall
