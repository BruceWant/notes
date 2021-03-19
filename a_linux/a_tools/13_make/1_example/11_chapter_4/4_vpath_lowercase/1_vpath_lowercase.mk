# 1.Specify the search path directories for file names that match pattern.
# vpath pattern directories
#
# 2.Clear out the search path associated with pattern.
# vpath pattern
#
# 3.Clear all search paths previously specified with vpath directives.
# vpath
#

# First run:
# 1. touch foo.c
# 2. make -f 1_vpath_lowercase.mk
#
# Second run:
# 1. mkdir src
# 2. touch src/foo.c
# 3. rm foo.c
# 4. make -f 1_vpath_lowercase.mk
vpath %.c src

all: foo.c
	@echo $^
