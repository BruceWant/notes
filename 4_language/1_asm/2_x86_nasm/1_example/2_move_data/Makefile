bin=data

flag=-g -dwarf2

$(bin): $(bin).o
	ld -m elf_i386 -g -o $(bin) $(bin).o

$(bin).o: $(bin).asm
	nasm $(flag) -f elf32 $(bin).asm


clean:
	rm $(bin) $(bin).o
