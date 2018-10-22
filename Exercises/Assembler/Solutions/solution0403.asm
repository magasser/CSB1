; Version:	1.0
; Author:	Gasser Manuel
; Date:		22.10.2018


SECTION .data
	text	db	"helloworld", 0Ah
	textLen	equ	$-text
SECTION .bss

SECTION .text

global _start

_start:
	mov	RBX, [text]
	mov	R15, [text+8]
	mov	RCX, 0
	mov	RAX, 0020h

loop:
	sub	RBX, RAX
	mov	RDX, 0100h
	mul	RDX
	inc	RCX
	cmp	RCX, 15
	jne	loop
	
	mov	RAX, 0020h
	mov	R14, R15
	mov	RCX, 0
loop2:
	sub 	R15, RAX
	mov	RDX, 0100h
	mul	RDX

	shr	R14, 8
	push	R14
	and	R14, 00FFh
	inc	RCX
	cmp	RCX, 15
	je	Exit
	cmp	R14, 0Ah
	je	Exit
	pop	R14
	jmp	loop2	

Exit:
	mov	[text+8], R15
	mov	[text], RBX
	mov	RAX, 1
	mov	RDI, 1
	mov	RSI, text
	mov	RDX, textLen
	syscall

	mov	RAX, 60
	mov	RSI, 0
	syscall
