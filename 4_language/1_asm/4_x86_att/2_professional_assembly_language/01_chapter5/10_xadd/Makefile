

xadd: xadd.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc -o xadd xadd.o

xadd.o: xadd.s
	as --32 -gstabs -o xadd.o xadd.s


clean:
	rm xadd.o xadd

