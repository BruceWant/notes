
bin=a.out
obj=asm_formatting.o
src=asm_formatting.asm

asm=yasm
LD=ld
flag=-g dwarf2
listf=-l asm_formatting.lst

$(bin) : $(obj)
	$(LD) -g -o $(bin) $(obj)

$(obj): $(src)
	$(asm) $(flag) -f elf64 $(src) $(listf)


clean:
	rm *.o *.lst a.out
