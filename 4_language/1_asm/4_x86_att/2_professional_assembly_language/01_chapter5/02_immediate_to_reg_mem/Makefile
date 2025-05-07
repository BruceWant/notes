

im_to_reg_mem: im_to_reg_mem.o
	ld -m elf_i386 -o im_to_reg_mem im_to_reg_mem.o

im_to_reg_mem.o: im_to_reg_mem.s
	as --32 -gstabs -o im_to_reg_mem.o im_to_reg_mem.s


clean:
	rm im_to_reg_mem.o im_to_reg_mem

