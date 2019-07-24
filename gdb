
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
run arguments

# or
gdb program_name
set args arguments

# debug core file
ulimit -c
ulimit -c unlimited		# have no limit
ulimit -c 10			# have 10 blocks, 512 bytes per block

gdb program_name core_name



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

