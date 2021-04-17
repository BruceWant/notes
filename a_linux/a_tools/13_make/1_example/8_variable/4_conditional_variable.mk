# This is called a conditional variable assignment operator,
# because it only has an effect if the variable is not yet defined
#
# command: make -f 4_conditional_variable.mk

#foo ?= bar

foo = test
ifeq ($(origin foo), undefined)
	foo = bar
endif


all::
	@echo $(foo)
