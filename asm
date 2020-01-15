
# x86
# Syntax

# Intel
mov	ecx,	AABBCCDDh
mov	ecx,	[eax]
mov	ecx,	eax

# AT&T
movl	$0xAABBCCDD,	%ecx
movl	(%eax),		%ecx
movl	%eax,		%ecx


# Common data types
Bytes:		8 bits
Word:		16 bits
double word:	32 bits
Quad word:	64 bits


# Five general methods in data movement
1.Immediate to register
2.Register to register
3.Immediate to memory
4.Register to memory and vice versa
5.Memory to memory			# Only for x86


# Mnemonic

# The comparison is performed by subtracting
# the second operand from the first operand
# and then settging the status flags in the
# same manner as the SUB instruction.
cmp

# Computing the bit-wise logical AND of first
# operand and the second operand and sets the
# SF, ZF, and PF status flags according to the
# result.
test

# movsb/movsw/movsd move data with 1- 2- and 4-
# bytes. They implicitly use EDI/ESI as the 
# destination/source address. The also automatically
# update destination/source address depending on
# direction flag(DF), if DF = 0, the address decrement
# if DF = 1, the address increament
movsb
rep movsb		# repeat movsb up to ECX.

# SCAS implicitly compares AL/AX/EAX with EDI,
# and automatically update EDI.
repne scasb

# STOS writs the value AL/AX/EAX to EDI.
rep stosd

# CALL instruction performs two operations
# 1.It pushes the return address (address
# immediately after the CALL instruction)
# on the stack.
# 2.It changes EIP to the call destination.
# popular calling convention:
# CDECL, STDCALL, THISCALL, FASTCALL
call

# RET simply pops the address stored on the top of
# the stack into EIP and transfers control to it.


# Set if the result of the previous arithmetic
# operation is zero.
ZF/Zero flag

# Set to the most significant bit of the result
SF/Sign flag

# Set when the result requires a carry. It applies
# to unsinged number.
CF/Carry flag

# Set if the result overflows the max size. It
# applies to signed number.
OF/Overflow flag
