#!/bin/bash

mountpoint=/mnt/cobbler

#Import isos to cobbler
for iso in `ls /mnt/iso`; do
	mount -t iso9660 -o loop,ro /mnt/iso/$iso $mountpoint
	cobbler import --name=$iso --arch=x86_64 --path=$mountpoint
	umount $mountpoint
done
