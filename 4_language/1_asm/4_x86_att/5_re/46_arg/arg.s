# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  output:
    .asciz "The area is: %f\n"
.section .bss
  .lcomm result, 4
.section .text
  .globl _start
_start:
  nop
  finit

  pushl 8(%esp)
  call atoi
  addl $4, %esp
  movl %eax, result
  fldpi
  filds result
  fmul %st(0), %st(0)
  fmul %st(1), %st(0)
  fstpl (%esp)
  pushl $output
  call printf
  addl $12, %esp

  pushl $0
  call exit
