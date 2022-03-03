# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  val:
    .int 1

.section .text
  .globl _start
_start:
  nop
  movl $0x12345678, %ebx
  xadd %ebx, val
  bswap %ebx
  movl $1, %eax
  int $0x80
