# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  output1:
    .asciz "There are %d parameters:\n"
  output2:
    .asciz "%s\n"
.section .text
  .globl _start
_start:
  movl (%esp), %ecx
  pushl %ecx
  pushl $output1
  call printf
  addl $4, %esp
  popl %ecx
  movl %esp, %ebp
  addl $4, %ebp

loop1:
  pushl %ecx
  pushl (%ebp)
  pushl $output2
  call printf
  addl $8, %esp
  popl %ecx
  addl $4, %ebp
  loop loop1
  pushl $0
  call exit
