#!/usr/bin/env bash
clear
echo -e "==================================================="
echo    "=         Selamat Datang Di Scipt Saya            ="
echo    "=     Hati-hati ketika menggunakan script         ="
echo    "=  Tidak Bertanggung Jawab Atas Kehilangan Data   ="
echo    "=                    Script Ini                   ="
echo    "=       Ini akan mempartisi ulang drive           ="
echo -e "==================================================="
echo    "=  Catatan : Drive hanya akan dipartisi menjadi 1 ="
echo    "=      untuk system, penyimpanan, dan home        ="
echo -e "==================================================="
echo -e "==================================================="
echo    "=             Pilih Drive/Target                  ="
echo    "=               Bukan Partisi                     ="
echo -e "==================================================="
lsblk
read -p "->] Pilih Drive (Contoh : sda atau nvmen1) = " drive
cfdisk /dev/${drive}
clear
lsblk
read -p "->] Pilih Partisi (Contoh : sda1 atau nvmen1p4) = " prts
mkfs.ext4 /dev/${prts}
mount /dev/${prts} /mnt
echo -e "==================================================="
echo    "=           Menginstall Base System...            ="
echo -e "==================================================="
#script

pacman -Sy sed packagekit-qt5 dbus --noconfirm --needed
#Add parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf
#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
#Pacstrap
pacstrap /mnt base base-devel linux linux-firmware linux-headers nano sudo packagekit-qt5 archlinux-keyring wget git libnewt ntfsprogs ntfs-3g dosfstools dos2unix e2fsprogs xfsprogs btrfs-progs --noconfirm --needed
genfstab -U /mnt >> /mnt/etc/fstab
echo "--------------------------------------------------------"
echo "           Setup Bahasa, lokal, Hostname & Hosts        "
echo "--------------------------------------------------------"
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
arch-chroot /mnt locale-gen
arch-chroot /mnt timedatectl --no-ask-password set-timezone Asia/Jakarta
arch-chroot /mnt timedatectl --no-ask-password set-ntp 1
arch-chroot /mnt localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_GB.UTF-8"

# Set keymaps
arch-chroot /mnt localectl --no-ask-password set-keymap us

# Set hostname & hosts
read -p "->] Masukkan Hostname/Nama Komputer (Contoh : pc atau acer) = " hstname
arch-chroot /mnt echo ${hstname} >> /etc/hostname
arch-chroot /mnt echo "127.0.0.1	localhost" >> /etc/hosts
arch-chroot /mnt echo "::1	localhost" >> /etc/hosts
arch-chroot /mnt echo "127.0.1.1	${hstname}.localdomain	${hstname}" >> /etc/hosts
arch-chroot /mnt pacman -Sy sed --noconfirm

# Add sudo no password rights
arch-chroot /mnt sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

# Add sudo rights
arch-chroot /mnt sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

#Add parallel downloading
arch-chroot /mnt sed -i 's/^#Para/Para/' /etc/pacman.conf

#Enable multilib
arch-chroot /mnt sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
arch-chroot /mnt pacman -Syu --noconfirm

