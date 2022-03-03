# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  values1:
    .int 1, -1, 0, 135246
  values2:
    .quad 1, -1
.section .text
  .globl _start
_start:
  nop
  movdqu values1, %xmm0
  movdqu values2, %xmm1

  movl $1, %eax
  movl $0, %ebx
  int $0x80
