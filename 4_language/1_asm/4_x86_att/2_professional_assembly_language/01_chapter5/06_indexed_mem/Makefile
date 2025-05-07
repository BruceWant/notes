

indexed_mem: indexed_mem.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc -o indexed_mem indexed_mem.o

indexed_mem.o: indexed_mem.s
	as --32 -gstabs -o indexed_mem.o indexed_mem.s


clean:
	rm indexed_mem.o indexed_mem

