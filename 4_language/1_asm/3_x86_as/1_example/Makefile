

exit: exit.o
	ld -m elf_i386 -o exit exit.o

exit.o: exit.s
	as --32 -gstabs -o exit.o exit.s


clean:
	rm exit.o exit
