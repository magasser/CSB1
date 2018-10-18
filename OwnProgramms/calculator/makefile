all: calculator64
	
clean:
	rm -rf *.o
calculator64: calculator64.o
	ld -o calculato64 calculator64.o
calculator64.o:
	nasm -f elf64 -g calculator64.asm

