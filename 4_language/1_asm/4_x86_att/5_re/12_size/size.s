# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .text
  .globl _start

_start:
  movl $1, %eax
  movl $0, %ebx
  int $0x80
