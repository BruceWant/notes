# command: make -f recursivly_expanded.mk
foo = $(bar)
bar = $(ugh)
ugh = Huh?

all:;echo $(foo)
