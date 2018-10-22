all: solution04

clean:
	rm -rf solution04
	rm -rf solution04.o

solution04:
	ld solution04.o -o solution04

solution04.o:
	nasm -f elf64 solution04.asm -g -F dwarf -o solution04.o
