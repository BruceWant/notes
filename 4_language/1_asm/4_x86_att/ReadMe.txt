# 1.question
$ ld -m elf_i386 -lc -o cpuid cupsi.o 
ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
ld: cannot find -lc: No such file or directory
ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc

# 1.solution
sudo apt-get install gcc-multilib
