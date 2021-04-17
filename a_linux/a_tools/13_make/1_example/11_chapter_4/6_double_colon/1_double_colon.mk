# command: make -f 1_double_colon
all::
	@echo test

test:
	@touch test

%:: test
	@echo second
