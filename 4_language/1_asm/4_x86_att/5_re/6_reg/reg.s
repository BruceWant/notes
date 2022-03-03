# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data

.section .bss


.section .text
  .global _start

_start:
  nop

  movl $22, %edx

mov_data_between_registers:
  movl %edx, %eax

exit:
  movl $1, %eax
  movl $0, %ebx
  int $0x80
