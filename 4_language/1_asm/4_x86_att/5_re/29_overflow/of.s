# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .text
  .globl _start
_start:
  nop
  movl $0, %ebx
  movb $190, %bl
  movb $10, %al
  addb %al, %bl
  jc over
  movl $1, %eax
  int $0x80
over:
  movl $1, %eax
  movl $0, %ebx
  int $0x80
