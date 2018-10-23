all: calculator64
	
clean:
	rm -r  calculator64.o
	rm -rf calculator64
calculator64: calculator64.o
	ld -o calculator64 calculator64.o
calculator64.o:
	nasm -f elf64 calculator64.asm -g -F dwarf

