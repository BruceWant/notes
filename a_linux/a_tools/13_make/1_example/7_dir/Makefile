
lastdir=$(word $(words $(subst /, ,$(1))),$(subst /, ,$(1)))
diralias=$(if $(findstring $(1),$(call lastdir,$(1))),,$(call lastdir,$(1)))


all:
	@echo $(call lastdir, ${CURDIR})
	@echo ${CURDIR}
	@echo $(call diralias, ${CURDIR})
