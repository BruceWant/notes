2.1 Invoking GDB
# run non-arguments program
gdb <program_name>
# debug running process
gdb <program_name> <PID>
# debug runing process with another mathod
gdb -p <PID>

# debug program with arguments, the --args option
# stop option processing for gdb.
gdb --args <executablename> arg1 arg2 arg3


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

gcc -g -o hello hello.c

# check whether a program can be debug or not
# can't be debug
gdb program_name		#  no debugging symbols found
# can debue
gdb program_name		# Reading sysbols form ...

readelf -S program | grep debug

# 1.load the program
file program_name		# stripped
# 2.break at main
break main
# 3.run program
continue



# run program with arguments
gdb program_name
run arg1 arg2 arg3

# or
gdb program_name
set args arg1 arg2 arg3

# or
gdb -ex=run --args myprogram arg1 arg2 arg3

# first, debug core file
ulimit -c
ulimit -c unlimited		# have no limit
ulimit -c 10			# have 10 blocks, 512 bytes per block
# second
sudo sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t


# view stack frames
gdb program_name core_name
# or (gdb) bt full
(gdb) bt                # backtrace, get a stack trace
(gdb) frame #number
# print only the innermost n frames
(gdb) bt <n>
# print only the outmost n frames
(gdb) bt -<n>
# print the values of the local variables
(gdb) bt -full
# see the code around the bug function
(gdb) list
# see the local variables
(gdb) info locals
# print the variable value
(gdb) print name_of_variable
# select frame n frames up
(gdb) up #n
# select frame n frames down
(gdb) down #n


# debug running program
gdb
(gdb) attach 20829
# vim /etc/sysctl.d/10-ptrace.conf
kernel.yama.ptrace_scope = 1 => kernel.yama.ptrace_scope = 0

# direct debug
gdb hello 20829
gdb hello --pid 20829

gdb
(gdb) file hello
(gdb) sttach 20829


# setting breakpoint
break <location>
# Specifying a <location>: linespec, Explicit, address location
# 1.linespec
# 1.1 Specifies the line number linenum of the current source file.
<linenum>
# 1.2 Specifies the line linenum in the source file filename.
<filename>:<linenum>
# 1.3 function Specifies the line that begins the body of the function.
<function>
# 1.4 Specifies the line where label appears in function.
<function>:<lable>
# 1.5 Specifies the line that begins the body of the function,
# 	function in the file filename.
<filename>:<function>
# 1.6 Specifies the line at which the label named label,
# 	appears in the function corresponding to the currently
# 	selected stack frame.
<label>
# 2. Explicit locations
# 	2.1 The value specifies the source file name.
-source <filename>
#	2.2 The value specifies the name of a function.
-function <function>
#	2.3 This flag makes GDB interpret a function name specified
#		with -function as a complete fully-qualified name.
#		For example, assuming a C++ program with symbols named
#		A::B::func and B::func, the break -qualified -function
#		B::func command sets a breakpoint on B::func, only.
-qualified
#	2.4 The value specifies the name of a label.
-label <label>
#	2.5 The value specifies a line offset for the location.
-line <number>
# 3. Address locations
# 	3.1 Any expression valid in the current working language.
<expression>
#	3.2 An address of a function or procedure derived from its name.
<funcaddr>
#	3.3 Like funcaddr above,
#		but also specifies the name of the source file explicitly.
<'filename'>:<funcaddr>


# 	specifies the line linenum in the source file
break filename:linenum
# set breakpoint
b 9
# or, at 9th line of test.c set a breakpoint
b test.c:9
# set breakpoint at function
b function_name			# b print
# specifies the line where label appears in function
break function:label
# specifies the line at which the label name label
break label
# specifies the line that begins the body of the function in the filename
break filename:function
# according conditon set breakpoint
break test.c:23 if b==0		# when b == 0 , at 23th line set break
condition 1 b==0		# when b == 0, at break number of 1
				# set break.
# set template breakpoint
tbreak test.c:10

# explicit locatoin
# specifies the source file name
-source filename
# specifies the name of the function
-function function
# for c++, A::B::func B::func
-qualified      # break -qualified -function B::func
# specifies the name of the label
-label label
# specifies a line offset for the location
-line number


# Display the current working language.
show language
# Display the source language for this frame, and stack contents.
info frame
# Display the source language of this source file.
info source
# List all the filename extensions and the associated languages.
info extensions


# strict type checking
set check type on
set check type off
show check type

# set language
set language <name>


# address locations
# any expression valid in the current working language
expression
# an address of a function or procedure derived from its name
funcaddr
# also specifies the name of the source file
'filename' funcaddr

# watch variable
(gdb) watch variable_name


# step into
(gdb) step
(gdb) step count		# or

# step into function which have no debug information
(gdb) stepi

#step over
(gdb) next


# step out of function
# Continue running until just after function in the selected stack frame returns. Print the returned value (if any). This command can be abbreviated as fin.
(gdb) finish

# print registers value
# 1.Print the names and values of all registers
# except floating-point and vector registers (in the selected stack frame).
info registers
# 2.Print the names and values of all registers,
# including floating-point and vector registers
# (in the selected stack frame).
info all-registers
# 3.Print a single register
info registers eax
# 4.print the instruction to be executed next with
x/i $pc

# print first 10 stack element
x/10x $sp

# list all global and static variable names(name and values)
info variables
# list local variable of current stack frame(name and values)
info locals
# list arguments of the current stack frame(name and values)
info args

# DGB has four "standard" register names
# 1. program counter register
$pc
# 2. stack pointer
$sp
# 3. contains a pointer to the current stack frame
$fp
# 4. contains the processor status
$ps


# print value
print <value_name>


# 10 Examining Data
# 10.4 Artificial Arrays
#   1.eg. If a program says
#   int *array = (int*) malloc (len * sizeof(int));
#   print the contents of array with:
#   The left operand of '@' must reside in memory.
print *array@len
#   2.Anthor way to create an artificial array is to use a cast
#   The value need not be in memory
(gdb) print/x (shor[2])0x12345678
$1 = {0x1234, 0x5678}
# also leave the array length out
(gdb) print/x (shor[])0x12345678
$1 = {0x1234, 0x5678}
# print register value as char
(gdb) print/c (char[4])$ebx

# 10.5 Output Formats
# Print the binary representation of the value in hexadecimal
print/x
# Print the binary representation of the value in decimal
print/d
# Print the binary representation of the value as an decimal,
# as if it were unsigned
print/u
# Print the binary representation of the value in octal.
print/o
# print the binary representaion of the value in bianry.
print/t
# Print as an address, both absolute in hexadecimal and
# as an offset from the nearest preceding symbol.
print/a
(gdb) p/a 0x54320
$3 = 0x54320 <_initialize_vx+396>
# Cast the value to an integer and print it as a character constant.
print/c
# Regard the bits of the value as a floating point number
print/f
# Regard as a string, if possible.
print/s
# Like 'x' formatting, but leading zeros are printed to pad the value.
print/z
# Print using the 'raw' formatting.
print/r

# 10.6 Examining Memory
# examine memory address
# n: the repeat count,
# 	If a negative number is specified,
# 	memory is examined backward from addr.
# f: the display format
# 	the display format is one of the formats used by print
# 	(‘x’, ‘d’, ‘u’, ‘o’, ‘t’, ‘a’, ‘c’, ‘f’, ‘s’),
# 	and in addition ‘i’ (for machine instructions).
# 	The default is ‘x’ (hexadecimal), 'm' for displaying memory tags.
# u: the unit size
# 	b: Bytes, h: Halfwords(two bytes), w: Words(four bytes).Default value
# 	g: Giant words(eight bytes)
# addr: starting display address
x/nfu addr
x addr
# examine machine instructions
x/5i $pc


# disassemble current instruction
disas


# set intel syntax
(gdb) set disassembly-flavor intel


# set register to certain value
set $eax = <value>
# for example
set $eax = 0x66


# debug with gdbserver
target remote 127.0.0.1:1234
