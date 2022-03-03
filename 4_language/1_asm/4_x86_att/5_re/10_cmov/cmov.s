# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  result:
    .asciz "The smallest value is "
  lr:
    .asciz ".\n"
  constants:
    .int 43, 144, 32, 549, 600, 7, 10, 11

.section .bss
  .comm answer, 1

.section .text
  .global _start

_start:
  nop

  movl constants, %ebx
  movl $1, %edi

find_smallest_value:
  movl constants(, %edi, 4), %eax
  cmp %ebx, %eax
  cmovb %eax, %ebx
  inc %edi
  cmp $8, %edi
  jne find_smallest_value
  addl $0x30, %ebx
  movl %ebx, answer

  movl $4, %eax
  movl $1, %ebx
  movl $result, %ecx
  movl $23, %edx
  int $0x80

  movl $4, %eax
  movl $1, %ebx
  movl $answer, %ecx
  movl $1, %edx
  int $0x80

  movl $4, %eax
  movl $1, %ebx
  movl $lr, %ecx
  movl $2, %edx
  int $0x80

exit:
  movl $1, %eax
  movl $0, %ebx
  int $0x80
