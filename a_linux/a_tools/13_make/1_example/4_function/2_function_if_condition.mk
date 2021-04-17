# command: ake -f 2_function_if_condition.mk
# $(if condition, then-part[, else-part])

# flag =
flag = asklfd
foo = $(if $(flag), "not empty string", "empty string")
all::
	@echo $(foo)
