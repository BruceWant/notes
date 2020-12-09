

all: a.o b.o d.o
	$(CC) -o test a.o b.o d.o

%.o : %.c
	echo $< $@
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm %.o test
