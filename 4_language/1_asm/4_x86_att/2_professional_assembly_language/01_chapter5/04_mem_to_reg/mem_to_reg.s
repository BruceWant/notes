.section .data
  value:
    .int 1
.section .text
.globl _start
  _start:
    nop
    movl value, %ecx
    movl $value, %edx

    movl $1, %eax
    movl $0, %ebx
    int $0x80

