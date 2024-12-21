#!/bin/bash
# gdb --args \
qemu-system-riscv64 -M virt \
-bios ~/Public/opensbi/build/platform/generic/firmware/fw_dynamic.elf \
-kernel ./arch/riscv/boot/Image \
-append "rootwait root=/dev/vda ro console=ttyS0,115200 earlycon earlyprintk ignore_loglevel" \
-drive file=~/Public/buildroot-2024.02.9/output/images/rootfs.ext2,format=raw,id=hd0,if=none \
-device virtio-blk-device,drive=hd0 \
-netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic \
-machine virt -m 1024 \
-serial mon:stdio \
-s -S

# -kernel /home/szx/Public/test/Image ./arch/riscv/boot/Image \

# -s -S
#-monitor telnet::45454,server,nowait \
#-s -S
#-d int \
#-nographic \
#-s -S \
