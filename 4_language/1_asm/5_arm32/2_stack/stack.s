@ Stack Pointer Demo - Stack Pointer Demo

@ arm-buildroot-linux-uclibcgnueabihf-as stack.s -o stack.o
@ arm-buildroot-linux-uclibcgnueabihf-ld stack.o -o stack

.global _start
_start:
  mov r7, #0x30         @ mov hex 30 into r7
  push {r7}             @ push 0x30 value onto the Stack
  mov r7, #0x10         @ mov hex 10 into r7
  pop {r7}              @ pop the value on the Stack, 0x30 back into r7

exit:
  mov r7, #1            @ sys_exit
  svc 0
