# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  constants:
    .int 5, 8, 17, 44, 50, 52, 60, 65, 70, 77, 80

.section .text
  .globl _start

_start:
  nop

indirect_addressing_with_registers:
  movl constants, %eax
  movl $constants, %edi
  movl $25, 4(%edi)
  movl $1, %edi
  movl constants(, %edi, 4), %ebx

exit:
  movl $1, %eax
  movl $0, %ebx
  int $0x80
