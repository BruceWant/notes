### 在 qemu 中，调试 xv6 应用层程序

1. 启动 xv6 内核

   ```
   $ make qemu-gdb
   ```

2. 在另外一个窗口中，启动 gdb

   ```
   $ gdb
   ```

3. 在 gdb 窗口中，调试应用层程序

   ```
   (gdb) c
   (gdb) file /your_xv6_source_path/user/_ls
   (gdb) b /your_xv6_source_path/user/ls.c:main
   (gdb) c
   ```

4. 在 qemu 窗口中，运行 ls 程序，ls将会停止运行等待调试，之后，便可以到 gdb 窗口进行调试

   ```
   root@tets:~# ls
   ```

5. 在 gdb 窗口调试 ls 程序

   ```
   (gdb) si
   ```

   

