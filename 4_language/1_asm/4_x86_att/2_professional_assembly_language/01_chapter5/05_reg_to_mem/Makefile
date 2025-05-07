

reg_to_mem: reg_to_mem.o
	ld -m elf_i386 -o reg_to_mem reg_to_mem.o

reg_to_mem.o: reg_to_mem.s
	as --32 -gstabs -o reg_to_mem.o reg_to_mem.s


clean:
	rm reg_to_mem.o reg_to_mem

