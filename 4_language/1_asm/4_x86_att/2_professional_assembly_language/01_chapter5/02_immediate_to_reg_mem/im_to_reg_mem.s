.section .bss
  .lcomm height, 1
.section .text
.globl _start
_start:
  movl $0, %eax
  movl $0x80, %ebx
  movl $100, height

  movl $1, %eax
  movl $0, %ebx
  int $0x80
