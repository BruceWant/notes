# command: as -o --32 bswap.o bswap.s
# command: ld -m elf_i386 -o bswap bswap.o
# command: ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o bswap -lc bswap.o
.section .data
.section .text

.globl _start

_start:
  movl $0x12345678, %eax
  bswap %eax
  bswap %eax

  pushl $0
  call exit
