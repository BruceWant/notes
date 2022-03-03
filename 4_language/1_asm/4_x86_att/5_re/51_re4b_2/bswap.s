# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .text

.globl _start

_start:
  movl 0x4(%esp), %eax
  bswap %eax
  mov   %eax, %edx
  and   $0x0f0f0f0f, %eax
  and   $0xf0f0f0f0, %edx
  shrl  $0x4, %edx
  shll  $0x4, %eax
  or    %edx, %eax
  movl  %eax, %edx
  and   $0x33333333, %eax
  and   $0xcccccccc, %edx
  shrl  $0x2, %edx
  shll  $0x2, %eax
  or    %edx, %eax
  mov   %eax, %edx
  and   $0x55555555, %eax
  and   $0xaaaaaaaa, %edx
  addl  %eax, %eax
  shrl  $0x1, %edx
  or    %edx, %eax

  movl $1, %eax
  movl $0, %ebx
  int $0x80
