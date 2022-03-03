# as --32 -gstabs -o <file.o> <file.s>
# ld -m elf_i386 -o <executable> <file.o>
.section .data
  result:
  uptime:
    .int 0
  load1:
    .int 0
  load5:
    .int 0
  load15:
    .int 0
  totalram:
    .int 0
  freeram:
    .int 0
  sharedram:
    .int 0
  bufferram:
    .int 0
  totalswap:
    .int 0
  freeswap:
    .int 0
  procs:
    .int 0
  totalhigh:
    .int 0
  memunit:
    .int 0
.section .text
  .globl _start
_start:
  nop
  movl $result, %ebx
  movl $116, %eax
  int $0x80


  movl $0, %ebx
  movl $1, %eax
  int $0x80
