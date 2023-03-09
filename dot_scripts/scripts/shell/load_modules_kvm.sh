#! /bin/bash
#  Author: jie
#  TIME: Fri Sep 30 06:32:06 PM CST 2022
#  USAGE: To check the dependences of kvm
# echo "If you get some output, the hardware support is ok:"
# LC_ALL=C lscpu | grep Virtualization
# echo "If you see kvm or kvm_amd or kvm_intel, and the setting is y or m, the kernel support is ok"
# zgrep CONFIG_KVM /proc/config.gz
# echo "You need to load kvm_intel, kvmgt, mdev, vfio, kvm, irqbypass"
# lsmod | grep kvm
for mode in kvm_intel kvmgt mdev vfio kvm irqbypass; do 
    sudo modprobe $mode
done

for virmode in virtio-net virtio-blk virtio-scsi virtio-serial virtio-balloon; do
    sudo modprobe $virmode
done
