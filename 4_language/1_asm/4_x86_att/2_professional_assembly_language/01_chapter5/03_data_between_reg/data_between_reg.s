.section .text
.globl _start
_start:
  movl $0, %eax
  movl $1, %ebx
  movl %eax, %ecx
  movl %ebx, %eax
  movl %ecx, %ebx

  movl $1, %eax
  movl $0, %ebx
  int $0x80

