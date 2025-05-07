

mem_to_reg: mem_to_reg.o
	ld -m elf_i386 -o mem_to_reg mem_to_reg.o

mem_to_reg.o: mem_to_reg.s
	as --32 -gstabs -o mem_to_reg.o mem_to_reg.s


clean:
	rm mem_to_reg.o mem_to_reg

