all: calculator64
	
clean:
	touch calculator.asm
	rm -rf *.o
	rm -rf calculactor64
calculator64: calculator64.o
	ld -o calculato64 calculator64.o
calculator64.o:
	nasm -f elf64 calculator64.asm

