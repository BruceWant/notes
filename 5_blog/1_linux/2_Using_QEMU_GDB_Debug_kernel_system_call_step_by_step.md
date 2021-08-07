### qemu+gdb 单步跟踪系统调用

1. Linux 内核版本：linux-5.12.9.tar.xz

2. 使用 qemu 启动 Linux 内核，最关键的启动参数：nokaslr，这个参数的作用是禁止内核地址随机化，所有参数如下：

   ```
   qemu-system-x86_64 \
           -m 2G \
           -smp 2 \
           -kernel /your_linux_kernel_source/arch/x86/boot/bzImage \
           -append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0 nokaslr" \
           -drive file=./stretch.img,format=raw \
           -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
           -net nic,model=e1000 \
           -enable-kvm \
           -nographic \
           -pidfile vm.pid \
           -s -S \
           2>&1 | tee vm.log
   ```

3. 在另外一个窗口中打开 gdb，在 gdb 命令行中输入加载 Linux 符号表的命令

   ```
   (gdb) file /your_linux_source_path/vmlinux
   (gdb) target remote 127.0.0.1:1234
   (gdb) b do_sys_open
   (gdb) c
   ```

4. 在 qemu 的命令行中，执行一个命令，比如 ls 可以调用 do_sys_open 函数，执行 ls 之后，系统在此阻塞，返回到 gdb 窗口，可以单步执行命令，调试Linux内核

   ```
   root@test:~# ls
   ```

   

