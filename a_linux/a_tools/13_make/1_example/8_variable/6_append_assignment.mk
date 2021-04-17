# command: make -f 6_append_assignment.mk
# Often it is useful to add more text to 
# the value of a variable already defined.


objects = main.o foo.o bar.o utils.o
objects += another.o

all::
	@echo $(objects)
