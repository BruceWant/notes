# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  string1:
    .ascii "This is a test - a long text string to scan."
  length:
    .int 44
  string2:
    .ascii "-"
.section .text
  .globl _start
_start:
  nop
  leal string1, %edi
  leal string2, %esi
  movl length, %ecx
  lodsb
  cld
  repne scasb
  jne notfound
  subw length, %ecx
  neg %cx
  movl $1, %eax
  movl %ecx, %ebx
  int $0x80
notfound:
  movl $1, %eax
  movl $0, %ebx
  int $0x80
