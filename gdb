
gcc -g -o hello hello.c

# check whether a program can be debug or not
# can't be debug
gdb program_name		#  no debugging symbols found
# can debue
gdb program_name		# Reading sysbols form ...

readelf -S program | grep debug

file program_name		# stripped


# run non-arguments program
gdb program_name

# run program with arguments
gdb program_name
run arg1 arg2 arg3

# or
gdb program_name
set args arg1 arg2 arg3

# or
gdb --args executablename arg1 arg2 arg3

# or
gdb -ex=run --args myprogram arg1 arg2 arg3

# first, debug core file
ulimit -c
ulimit -c unlimited		# have no limit
ulimit -c 10			# have 10 blocks, 512 bytes per block
# second
sudo sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t

gdb program_name core_name
# or (gdb) bt full
(gdb) bt                # backtrace, get a stack trace
(gdb) frame #number
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
# specifies the line linenum in the source file
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


# print registers value
info registers
info registers eax


# print value
print <value_name>
