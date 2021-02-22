
hello: hello.o
	ld -m elf_i386 -s -o hello hello.o

hello.o: hello.asm
	nasm -f elf32 hello.asm


clean:
	rm hello hello.o
