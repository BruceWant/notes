
all:
	@echo $(MAKEFILE_LIST)
	@echo $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
