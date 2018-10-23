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
	
	jmp	_printFirst		; Start of the program

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
	mov	RBX, first
	call	_convertStrToNr
	jmp	_printSecond	

_convertStrToNr:
	mov	RAX, 16
	sub	byte [RBX], 30h
	inc	RBX
	dec	RAX
	mov	R15, [RBX]
	and	R15, 00FFh
	cmp	R15, 0Ah
	je 	Return1
	jnz	_convertStrToNr 	
Return1:
	sub	byte [RBX], 0Ah
	ret

_getSecond:
	mov	RAX, 0
	mov	RDI, 0
	mov	RSI, second
	mov	RDX, 16
	syscall
	mov	RBX, second
	call	_convertStrToNr
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
	cmp	RAX, RBX
	je	Add
	cmp 	RAX, 0A2Dh
	je 	Sub

Add:
	mov	RAX, [first]
	mov	RBX, [second] 
	add	RAX, RBX
	mov	[result], RAX
	jmp	_printResult
Sub:
	mov	RAX, [first]
	mov	RBX, [second]
	sub	RAX, RBX
	mov	[result], RAX
	jmp	_printResult
	
_convertNrToStr:
	mov	RAX, 16
	add	byte [RBX], 30h
	inc	RBX
	dec	RAX
	mov	R15, [RBX]
	and	R15, 00FFh
	cmp	R15, 00h
	je	Return2
	jnz	_convertNrToStr
Return2:
	ret

_printResult:
	mov	RBX, result
	call	_convertNrToStr
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
