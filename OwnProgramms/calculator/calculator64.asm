; Executable name: 	CALCULATOR64
; Version:		0.1
; Created date:		18/10/2018
; Last update:		18/10/2018
; Author:		Gasser Manuel
; Descpription:		A simple calculator in assembly for Linux

SECTION .data
	FirstN	 db 	"Enter first number:", 0Ah
;	SecondN	 db 	"Enter second number:", 0Ah
	FirstL	 equ	$-FirstN
;	SecondL	 equ	$-SecondN
	
SECTION .bss
	first	resb 16
	second  resb 16
SECTION .text

global _start

_start:	
	
	call _printFirst
	call _getFirst
;	call _printSecond
;	call _getSecond

Exit:
	mov	RAX, 60
	mov	RDI, 0
	syscall

_printFirst:
	mov	RAX, 1
	mov 	RDI, 1
	mov	RSI, FirstN
	mov	RDX, FirstL
	syscall
	ret

_printSecond:
	mov 	RAX, 1
	mov	RDI, 1
	mov	RSI, SecondN
	mov	RDX, SecondL
	syscall
	ret

_getFirst:
	mov	RAX, 0
	mov	RDI, 0
	mov	RSI, first
	mov	RDX, 16
	syscall
	ret

_getSecond:
	mov	RAX, 0
	mov	RDI, 0
	mov	RSI, second
	mov	RDX, 16
	syscall
	ret
