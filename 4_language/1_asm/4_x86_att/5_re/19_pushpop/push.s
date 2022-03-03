# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  data:
    .int 125

.section .text
  .globl _start

_start:
  nop
  movl $24420, %ecx
  movw $350, %bx
  movb $100, %al
  pushl %ecx
  pushw %bx
  pushl %eax
  pushl %eax
  pushl data
  pushl $data

  popl %eax
  popl %eax
  popl %eax
  popw %ax
  movl $0, %ebx
  movl $1, %eax
  int $0x80
