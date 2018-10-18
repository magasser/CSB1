all: calculator64
	
clean:
	touch calculator64.asm
	rm *.o
calculator64: calculator64.o
	ld -o calculato64 calculator64.o
calculator64.o:
	nasm -f elf64 calculator64.asm

