# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  data1:
    .byte 0x34, 0x12, 0x00, 0x00, 0x00,0x00,0x00,0x00,0x00,0x00
  data2:
    .int 2
.section .text
  .globl _start
_start:
  nop
  fbld data1
  fimul data2
  fbstp data1

  movl $1, %eax
  movl $0, %ebx
  int $0x80
