

indirect_addr_reg: indirect_addr_reg.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc -o indirect_addr_reg indirect_addr_reg.o

indirect_addr_reg.o: indirect_addr_reg.s
	as --32 -gstabs -o indirect_addr_reg.o indirect_addr_reg.s


clean:
	rm indirect_addr_reg.o indirect_addr_reg

