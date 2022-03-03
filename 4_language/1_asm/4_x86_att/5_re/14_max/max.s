# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  output:
    .asciz "The largest value is %d\n"
  values:
    .int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5

.section .text
  .globl _start

_start:
  nop
  movl values, %ebx
  movl $1, %edi

loop:
  movl values(, %edi, 4), %eax
  cmpl %ebx, %eax
  cmova %eax, %ebx
  inc %edi
  cmpl $10, %edi
  jne loop
  
  pushl %ebx
  pushl $output
  call printf
  addl $8, %esp

  push $0
  call exit
