# command: make -f 7_override.mk CFLAGS='-Wall -test'
#
# If a variable has been set with a command argument,
# then ordinary assignments in the makefile are ignored.
# If you want to set the variable in the makefile
# even though it was set with a command argument,
# you can use an override directive, which is a line that looks like this

#CFLAGS += -g
override CFLAGS += -g

all::
	@echo $(CFLAGS)

all::
	@echo $(CFLAGS)

