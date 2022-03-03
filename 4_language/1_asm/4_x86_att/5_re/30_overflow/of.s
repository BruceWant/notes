# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  output:
    .asciz "The result is %d\n"

.section .text
  .globl _start
_start:
  movl $-190876934, %ebx
  movl $-125923014, %eax
  addl %eax, %ebx
  jo over
  pushl %ebx
  pushl $output
  call printf
  add $8, %esp
  pushl $0
  call exit
over:
  pushl $0
  pushl $output
  call printf
  add $8, %esp
  pushl $0
  call exit
