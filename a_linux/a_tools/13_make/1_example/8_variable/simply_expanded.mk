# command: make -f simply_expanded.mk
x := foo
y := $(x) bar
x := later

#x = foo
#y = $(x) bar
#x = later

all:;echo $(x) $(y)
