

data_between_reg: data_between_reg.o
	ld -m elf_i386 -o data_between_reg data_between_reg.o

data_between_reg.o: data_between_reg.s
	as --32 -gstabs -o data_between_reg.o data_between_reg.s


clean:
	rm data_between_reg.o data_between_reg

