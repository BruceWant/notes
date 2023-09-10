.section .data

hello:
  .asciz "hello world\n"
out:
  .asciz "HELLO WORLD\n"

.section .bss
.section .text

.global _start
_start:

  movq $hello, %rsi
  movq $out, %rdi
  movq $13, %rcx
  rep
  movb $rsi, $rdi
  movq $0, %rbx
  int $0x80
