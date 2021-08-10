# command: as --32 -o exit.o exit.s
# command: ld -m elf_i386 -o exit exit.o
# ld --version
# ld -V

.section .data

.section .bss
  .lcomm buffer 1

.section .text

  .global _start

_start:
  nop

mov_immedate_data_to_register:
  movl $100, %eax
  movl $0x50, buffer

exit:
  movl $1, %eax
  movl $0, %ebx
  int $0x80
