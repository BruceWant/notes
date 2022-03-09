# command: riscv32-buildroot-linux-gnu-as main.S -o main.o
# command: riscv32-buildroot-linux-gnu-ld -dynamic-linker /lib/ld-linux-riscv32-ilp32d.so.1 -lc -o main main.o cfunc.o

.section .rodata
enter_prompt: .asciz "Enter a, b, and c: "
scan: .asciz "%d %d %d"
result_out: .asciz "Result = %d\n"
.section .text
.global _start
_start:
    addi    sp, sp, -32     # Allocate 32 bytes from the stack
    sw      ra, 0(sp)       # Since we are making calls, we need the original ra
    # Prompt the user first
    la      a0, enter_prompt 
    jal     ra, printf
    # We've printed the prompt, now wait for user input
    la      a0, scan
    addi    a1, sp, 8        # Address of a is sp + 8
    addi    a2, sp, 16       # Address of b is sp + 16
    addi    a3, sp, 24       # Address of c is sp + 24
    jal     ra, scanf
    # Now all of the values are in memory, load them
    # so we can jal ra, the c function.
    lw      a0, 8(sp)
    lw      a1, 16(sp)
    lw      a2, 24(sp)
    jal     ra, cfunc
    # The result should be in a0, but that needs to be
    # the second parameter to printf.
    add     a1, zero, a0
    la      a0, result_out
    jal     ra, printf
    # Restore original RA and return
    lw      ra, 0(sp)
    addi    sp, sp, 32       # Always deallocate the stack!
    jalr    zero, 0(ra)

