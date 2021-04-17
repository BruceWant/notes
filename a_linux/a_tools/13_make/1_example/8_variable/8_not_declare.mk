# command: make -f 8_not_declare.mk
# command: make -f 8_not_declare.mk test=4
# command: make -f 8_not_declare.mk test=1
ifneq ($(test),1)
test:=3

all::
	@echo $(test)
endif
