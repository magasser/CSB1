; Name		: Math
; Author	: Gasser Manuel
; Created	: 01/11/2018
; Last updated	: 01/11:2018
; Description	: Simple Math library which includes usefull math functions 
;		  for easy use.

section .data

section .bss

section .text

; ____________________________________________________________________________________
; String to Number
; ____________________________________________________________________________________
;
; Description:
; This function takes the address of the string value in memory in RAX and the length
; of the string in RDX and returns the value of the string as a number in RBX
;
; Registers:
; Input	: RAX, RDX
; Output: RBX
; ____________________________________________________________________________________

StringtoNumber:
	push 	RAX		; Push the registers used in this function on the stack
	push	RCX
	push	RDX
	
	xor	RCX, RCX		; Set RCX to 0 to use it as counter later

.loop:
	sub	byte [RAX+RCX], 30h
	inc	RCX
	cmp	RCX, RDX
	jne	.loop

	mov	RBX, [RAX]	; Copy the number from the memory in the RBX register
	
			
	pop	RDX		; Pop the user data of the registers from the stack
	pop	RCX
	pop	RAX
	ret
