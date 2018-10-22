; Version:	1.0
; Author:	Gasser Manuel
; Date:		22.10.2018

SECTION .data
	number	dd	35.0
SECTION .bss
	
SECTION .text

global _start

_start:
	mov	R15, [number]
	
Exit:
	mov	RAX, 60
	mov	RSI, 0
	syscall
