# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  data:
    .int 11

.section .text
  .globl _start

_start:
  nop
  movl $10, %eax
  movl $5, %ebx
  cmpxchg %ebx, data

  movl $1, %eax
  movl $0, %ebx
  int $0x80
