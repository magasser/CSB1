; Executable name: 	CALCULATOR64
; Version:		0.1
; Created date:		18/10/2018
; Last update:		18/10/2018
; Author:		Gasser Manuel
; Descpription:		A simple calculator in assembly for Linux

SECTION .data
	FirstN	 	db 	"Enter first number:", 0Ah
	FirstL	 	equ	$-FirstN
	SecondN	 	db 	"Enter second number:", 0Ah
	SecondL	 	equ	$-SecondN
	Operand  	db	"Enter your operand:", 0Ah
	OperandL 	equ	$-Operand
	LineFeed 	db	0Ah
	LineFeedL 	equ	$-LineFeed
	Result	 	db	"Result: ", 0Ah
	ResultL	 	equ	$-Result
	
SECTION .bss
	first	resb 16
	second  resb 16
	operand resb 16
	result	resb 16
SECTION .text

global _start

_start:	
	
	jmp	_printFirst

_printFirst:
	mov	RAX, 1
	mov 	RDI, 1
	mov	RSI, FirstN
	mov	RDX, FirstL
	syscall
	jmp	_getFirst

_printSecond:
	mov 	RAX, 1
	mov	RDI, 1
	mov	RSI, SecondN
	mov	RDX, SecondL
	syscall
	jmp	_getSecond

_printOperand:
	mov	RAX, 1
	mov	RDI, 1
	mov	RSI, Operand
	mov	RDX, OperandL
	syscall
	jmp	_getOperand

_getFirst:
	mov	RAX, 0
	mov	RDI, 0
	mov	RSI, first
	mov	RDX, 16
	syscall


	mov 	RCX, 1
	mov	RBX, 0
	mov	RDX, 0
Repeat:
	mov	RAX, [first]
	and	RAX, 00FFh
	sub	RAX, 030h
	mov	RAX, [first]
	push	RBX
	mov	RBX, 0100h
	div	RBX
	pop	RBX
	mov	[first], RAX
	push	RBX
	mov	RBX, RCX
Loop:
	push	RBX
	mov	RBX, 010h
	mul	RBX
	pop	RBX
	dec	RBX
	cmp	RBX, 0
	je	Loop
	
	mov	RBX, 010h
	div	RBX
	pop	RBX
	add	RBX, RAX
	cmp	RCX, 16
	inc	RCX
	je	Repeat
	push	RBX
	jmp 	_printSecond

_getSecond:
	mov	RAX, 0
	mov	RDI, 0
	mov	RSI, second
	mov	RDX, 16
	syscall

	mov	RAX, [second]
	and	RAX, 00FFh
	sub	RAX, 030h
	push	RAX
	jmp	_printOperand

_getOperand:
	mov	RAX, 0
	mov	RDI, 0
	mov	RSI, operand
	mov	RDX, 16
	syscall
	jmp	_calculateResult

_calculateResult:
	mov	RAX, [operand]
	mov	RBX, 0A2Bh
	CMP	RAX, RBX
	JE 	Add
	CMP 	RAX, 0A2Dh
	JE 	Sub

Add:
	pop	RBX
	pop	RAX, 
	add	RAX, RBX
	jmp	_printResult
Sub:
	pop	RBX
	pop	RAX
	sub	RAX, RBX
	jmp	_printResult
	
_printResult:
	mov	RBX, RAX
	add	RBX, 030h
	mov	[result], RBX
	mov	RAX, 1
	mov	RDI, 1
	mov	RSI, Result
	mov	RDX, ResultL
	syscall

	mov	RAX, 1
	mov	RDI, 1
	mov	RSI, result
	mov	RDX, 16
	syscall
	
	mov	RAX, 1
	mov	RDI, 1
	mov	RSI, LineFeed
	mov	RDX, LineFeedL
	syscall
	jmp	Exit

Exit:
	mov	RAX, 60
	mov	RDI, 0
	syscall
