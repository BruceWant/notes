# command: make -f 5_shell_assignment.mk
hash != printf '\110\145\154\154\157'
file_list != find . -name '*.mk'

# If the result of the execution could produce a $,
# and you don’t intend what follows that to be interpreted
# as a make variable or function reference,
# then you must replace every $ with $$ as part of the execution.
# Alternatively, you can set a simply expanded variable
# to the result of running a program using the shell function call
x := $(shell printf '\044')
y := $(shell find . -name "*.mk")

all::
	@echo $(hash)
	@echo $(file_list)
	@echo
	@echo $(x)
	@echo $(.SHELLSTATUS)
	@echo $(y)
	@echo $(.SHELLSTATUS)
