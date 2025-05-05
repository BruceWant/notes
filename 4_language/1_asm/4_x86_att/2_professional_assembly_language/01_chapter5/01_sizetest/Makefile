

sizetest1: sizetest1.o
	ld -m elf_i386 -o sizetest1 sizetest1.o

sizetest1.o: sizetest1.s
	as --32 -gstabs -o sizetest1.o sizetest1.s


clean:
	rm sizetest1.o sizetest1

# make sizetest2
sizetest2: sizetest2.o
	ld -m elf_i386 -o sizetest2 sizetest2.o

sizetest2.o: sizetest2.s
	as --32 -gstabs -o sizetest2.o sizetest2.s


clean2:
	rm sizetest2.o sizetest2

# make sizetest3
sizetest3: sizetest3.o
	ld -m elf_i386 -o sizetest3 sizetest3.o

sizetest3.o: sizetest3.s
	as --32 -gstabs -o sizetest3.o sizetest3.s


clean3:
	rm sizetest3.o sizetest3

all: sizetest1 sizetest2 sizetest3

cleanall: clean clean2 clean3

