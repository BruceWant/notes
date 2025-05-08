.section .text
.globl _start
_start:
  nop
  movl $10, %ebx
  movl $1, %ecx
  xadd %ecx, %ebx

  movl $1, %eax
  int $0x80
