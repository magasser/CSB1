; Name		: String
; Author	: Gasser Manuel
; Created	: 01/11/2018
; Last updated	: 01/11:2018
; Description	: Simple String library for handling of string functions.

section .data

section .bss

section .text

global StringToNumber 		; Functions

; ____________________________________________________________________________________
; String to Number
; ____________________________________________________________________________________
;
; Description:
; This function takes the address of the string value in memory in RAX and the length
; of the number in RDX and returns the value of the string as a number in RBX
;
; Registers:
; Input	: RAX, RDX
; Output: RBX
; ____________________________________________________________________________________

StringToNumber:
	push 	RAX			; Push the registers used in this function on the stack
	push	RCX
	push	RDX
	
	xor	RCX, RCX		; Set RCX to 0 to use it as counter later
	mov	RCX, RDX		; Set RCX counter to the length of the number

.loop:
	sub	byte [RAX+RCX], 30h
	dec	RCX
	jnz	.loop

	xor	RCX, RCX		; Reset the counter
	mov	RCX, RDX
	xor	RDX, RDX		; Reset the RDX register
	mov	RDX, [RAX]		; Copy the value of the memory in RBX
	xor	RAX, RAX		; Reset RAX register

; Reverse the number from the memory
.loop2:
	mov	RBX, 10			; Multiply the value in RAX by 10
	mul	RBX
	shr	RDX, 4			; Shift the number in RDX right by 4 bits
	mov	AL, DL			; Copy the lower 4 bits of the DX register in AL
	dec 	RCX			; Decrement the counter
	jnz	.loop2			; Repeat if end of number is not reached
	
	pop	RDX			; Pop the user data of the registers from the stack
	pop	RCX
	pop	RAX
	ret
