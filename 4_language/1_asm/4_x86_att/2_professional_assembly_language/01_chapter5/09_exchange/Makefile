

exchange: exchange.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc -o exchange exchange.o

exchange.o: exchange.s
	as --32 -gstabs -o exchange.o exchange.s


clean:
	rm exchange.o exchange

