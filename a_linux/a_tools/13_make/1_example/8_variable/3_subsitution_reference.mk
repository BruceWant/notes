# A substitution reference substitutes the value of a variable
# with alterations that you specify.
#
# command: make -f 3_subsitution_reference.mk
foo := a.o b.o l.a c.o
bar := $(foo:.o=.c)

x := a.o b.o l.a c.o
y := $(x:%.o=%.c)

all::
	@echo $(foo)
	@echo $(bar)
	@echo
	@echo $(x)
	@echo $(y)
