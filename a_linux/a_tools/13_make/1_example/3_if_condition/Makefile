# 1.command: make
# 2.command: make cond=test_string
# 2.command: make cond=all

all:
ifeq ($(cond),)
	@echo "empty"
else
	@echo $(cond)
endif

ifeq ($(cond),all)
	@echo $(cond)
else
	@echo not all
endif
