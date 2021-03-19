# first run:
# 1. touch foo.c
# 2. make -f 1_vpath.mk
#
# Second run:
# 1. mkdir src
# 2. touch src/foo.c
# 3. rm foo.c
# 4. make -f 1_vpath.mk
#


VPATH = src: ../test
foo.o : foo.c
	@echo $<
