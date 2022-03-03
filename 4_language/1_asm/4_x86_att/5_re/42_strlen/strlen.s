# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  string1:
    .asciz "Testing, one, two, three, testing\n"
.section .text
  .globl _start
_start:
  nop
  leal string1, %edi
  movl $0xffff, %ecx
  movb $0, %al
  cld
  repne scasb
  jne notfound
  subw $0xfff, %cx
  neg %cx
  dec %cx
  movl $1, %eax
  movl %ecx, %ebx
  int $0x80
notfound:
  movl $1, %eax
  movl $0, %ebx
  int $0x80
