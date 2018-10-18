;  Executable name : EATSYSCALL64
;  Version         : 2.0
;  Created date    : 08/30/2016
;  Last update     : 08/30/2016
;  Author          : Gasser Manuel 
;  Description     : A simple program in assembly for Linux, using NASM,
;    demonstrating the use of Linux 64-bit syscalls to display text 5 times.
; 
;  Build using these commands:
;    nasm -f elf64 -g eatsyscall64.asm
;    ld -o eatsyscall64 eatsyscall64.o
;

SECTION .data			; Section containing initialised data
	
	EatMsg: db "Eat at Joe's!",10
	EatLen: equ $-EatMsg	
	Loop: 	equ 5	
SECTION .bss			; Section containing uninitialized data	

SECTION .text			; Section containing code

global 	_start			; Linker needs this to find the entry point!
	
_start:
	nop			; This no-op keeps gdb happy...
	mov rbx, Loop		; Write Nr. of repetisions in
				; the RBX register to count down
Write:	mov 	rax, 1		; Code for Sys_write call
	mov 	rdi, 1		; Specify File Descriptor 1: Standard Output
	mov 	rsi, EatMsg	; Pass offset of the message
	mov 	rdx, EatLen	; Pass the length of the message
	syscall			; Make kernel call

	dec 	rbx		; Decrement the loop counter
	jz 	End		; Repeat loop if counter not zero
	jnz 	Write		; Jump to the end if counter is zero
End:
	mov rax, 60		; Code for exit
	mov rdi, 0 		; Return a code of zero
	syscall			; Make kernel call



