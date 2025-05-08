

condition_move: condition_move.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc -o condition_move condition_move.o

condition_move.o: condition_move.s
	as --32 -gstabs -o condition_move.o condition_move.s


clean:
	rm condition_move.o condition_move

