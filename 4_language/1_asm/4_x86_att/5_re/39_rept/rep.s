# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  string1:
    .asciz "This is a test of the conversion program!\n"
  length:
    .int 43
  divisor:
    .int 4
.section .bss
  .lcomm buffer, 43

.section .text
  .globl _start
_start:
  nop

  leal string1, %esi
  leal buffer, %edi
  movl length, %ecx
  shrl $2, %ecx

  cld
  rep movsl
  movl length, %ecx
  andl $3, %ecx
  rep movsb

  movl $1, %eax
  movl $0, %ebx
  int $0x80
