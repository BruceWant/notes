### 使用 QEMU + gdb 搭建调试 Linux 内核环境

1. 获取 Linux 源码

   ```
   $ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
   
   // 镜像地址，下载速度更快。
   $ git clone git://kernel.source.codeaurora.cn/pub/scm/linux/kernel/git/torvalds/linux.git
   ```

2. 安装依赖环境

   ```
   sudo apt install flex bison libssl-dev libelf-dev debootstrap qemu-system dwarves qemu-kvm qemu-system-x86
   ```

   

3. 编译 Linux 内核

   ```
   // 第一步,进入 Linux 源码目录
   $ cd /your_linux_source_path/linux
   $ make CC="$GCC/bin/gcc" defconfig
   
   // 第二步，打开内核调试宏：CONFIG_DEBUG_INFO=y，CONFIG_GDB_SCRIPTS=y
   $ make menuconfig
   // 选择如下路径：
   Kernel hacking  --->  Compile-time checks and compiler options  ---> [*] Compile the kernel with debug info
   
   Kernel hacking  --->  Compile-time checks and compiler options  ---> [*]   Provide GDB scripts for kernel debugging
   添加完以上两个选项之后，会保存到 .config 文件中，内核会根据这个文件中定义的宏编译内核。
   
   // 第三步，编译内核
   $ make -j<N>
   <N>: 多线程编译，N 一般为系统cpu内核数的 2 倍，可提高编译速度。
   ```

4. 利用谷歌的开源项目 syzkaller，制作文件根系统。

   ```
   // syzkaller 网址：https://github.com/google/syzkaller
   // 下载 create-image.sh
   $ wget https://raw.githubusercontent.com/google/syzkaller/master/tools/create-image.sh -O create-image.sh
   // 添加执行权限
   $ chmod +x create-image.sh
   // 复制到 Linux 源码目录
   $ cp create-image.sh /your_linux_source_path/linux
   // 创建
   $ create-image.sh
   ```

5. 运行 qemu，启动 Linux 内核，可以将如下命令放在脚本中执行，**需要替换内核路经**

   ```
   #!/bin/bash
   
   export KERNEL=/root/linux-5.12-rc3 # Change this to the path to your kernel
   
   qemu-system-x86_64 \
           -m 2G \
           -smp 2 \
           -kernel $KERNEL/arch/x86/boot/bzImage \
           -append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
           -drive file=./stretch.img,format=raw \
           -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
           -net nic,model=e1000 \
           -enable-kvm \
           -nographic \
           -pidfile vm.pid \
           2>&1 | tee vm.log
   ```

6. 至此，Linux 内核已成功启动，可以正常运行 ls 等常用工具。

