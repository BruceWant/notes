# also run: /lib/ld-linux.so.2 ./cupid
# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc -o <executable> <file.o>
.section .data
output:
  .asciz "The processor Vendor ID is '%s'\n"
.section .bss
  .lcomm buffer, 12

.section .text
.globl _start
_start:
  movl $0, %eax
  cpuid
  movl $buffer, %edi
  movl %ebx, (%edi)
  movl %edx, 4(%edi)
  movl %ecx, 8(%edi)
  pushl $buffer
  pushl $output
  call printf
  addl $8, %esp
  push $0
  call exit
