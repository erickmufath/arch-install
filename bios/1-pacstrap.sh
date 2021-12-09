#!/usr/bin/env bash
echo -e " --------------------------------------------------------------------"
echo -e "  █▀█ ▄▀█ █▀▀ █▀ ▀█▀ █▀█ ▄▀█ █▀█   ▄▀█ █▀█ █▀▀ █░█ █░░ █ █▄░█ █░█ ▀▄▀"
echo -e "  █▀▀ █▀█ █▄▄ ▄█ ░█░ █▀▄ █▀█ █▀▀   █▀█ █▀▄ █▄▄ █▀█ █▄▄ █ █░▀█ █▄█ █░█"
echo -e "  Also Configure fstab config "
echo -e " --------------------------------------------------------------------"
echo "--------------------------------------"
echo -e "\nPacstrap Dimulai...\n$HR"
echo "--------------------------------------"
#script
pacstrap /mnt base base-devel linux linux-firmware linux-headers nano sudo archlinux-keyring wget git libnewt intel-ucode ntfsprogs ntfs-3g dosfstools dos2unix e2fsprogs xfsprogs btrfs-progs --noconfirm --needed
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
