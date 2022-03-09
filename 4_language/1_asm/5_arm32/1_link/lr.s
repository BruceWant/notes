@ LR Demo - Link Register Demo
@ arm-buildroot-linux-uclibcgnueabihf-as lr.s -o lr.o
@ arm-buildroot-linux-uclibcgnueabihf-ld lr.o -o lr

.global _start
_start:
  mov r7, #0x30         @ mov hex 30 into r7
  b no_return           @ branch to no_return function which never returns

no_return:
  mov r7, #1            @ mov decimal 1 into r7
  bl my_function        @ go to my_function which after execution
                        @ will after this
                        @ bl loads the return address of wrap_up into lr

warp_up:
  mov r7, #0x12         @ mov hex 12 into r7
  b exit                @ branch to exit

my_function:
  mov r0, #10           @ mov decimal 10 into r10
  mov pc, lr            @ mov the ret address into the program counter
                        @ here is where we return back to where we first
                        @ bl therefore we go to wrap_up

exit:
  mov r7, #1
  svc 0
