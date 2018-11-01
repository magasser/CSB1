section .data
	MyString:	db "123", 0Ah
	StrL:		equ $-MyString
section .bss

section .text

extern StringToNumber
global _start

_start:
	mov	RAX, MyString
	mov	RDX, StrL
	call	StringToNumber

Exit:
	mov	RAX, 60
	mov	RDI, 0
	syscall
