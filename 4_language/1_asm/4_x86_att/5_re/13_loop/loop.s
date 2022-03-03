# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  output:
    .asciz "The value is %d\n"
  values:
    .int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60

.section .text
  .globl _start


_start:
  nop
  movl $0, %edi
loop:
  movl values(, %edi, 4), %eax
  pushl %eax
  pushl $output
  call printf
  addl $8, %esp
  inc %edi
  cmpl $11, %edi
  jne loop

  movl $1, %eax
  movl $0, %ebx
  int $0x80
