#!/usr/bin/bash


KERNEL=/home/<user_name>/2_proj/1_vul/1_kernel/linux
IMAGE=/home/<user_name>/2_proj/1_vul/2_image

qemu-system-x86_64 \
  -kernel $KERNEL/arch/x86/boot/bzImage \
  -append "console=ttyS0 root=/dev/sda nokaslr slub_debug=P kmemleak=off"\
  -hda $IMAGE/stretch.img \
  -net user,hostfwd=tcp::2222-:22 -net nic \
  -enable-kvm \
  -cpu host \
  -nographic \
  -serial mon:stdio \
  -m 1G \
  -s \
  -smp 1 \
  -pidfile Kernel.Boot.pid \
  2>&1 | tee Kernel.Boot.log
