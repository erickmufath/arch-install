#!/usr/bin/env bash
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
konfirmasi () {
read -p "Apa kamu yakin untuk menggunakan script ini (y/N):" cnfrm
case $cnfrm in
y|Y|yes|Yes|YES)
pilihdrive
;;
*)
echo -e "==================================================="
echo    "=  Masukkan Tidak Valid/Anda Menolak Melanjutkan  ="
echo -e "==================================================="
sleep 2
clear
;;
esac
}
pilihdrive () {
echo -e "==================================================="
echo    "=             Pilih Drive/Target                  ="
echo    "=               Bukan Partisi                     ="
echo -e "==================================================="
lsblk
read -p "Pilih Drive (Contoh : sda atau nvmen1) = " drive
cfdisk /dev/${drive}
clear
lsblk
read -p "Apa Drive dan Konfigurasi Partisi Anda Sudah Benar (y/N):" conprts
case $conprts in
y|Y|yes|Yes|YES)
;;
*)
echo -e "==================================================="
echo    "=     Memulai Ulang Pemilihan Drive & Partisi     ="
echo -e "==================================================="
sleep 2
pilihdrive
clear
;;
esac
read -p "Pilih Partisi (Contoh : sda1 atau nvmen1p4) = " prts
mkfs.ext4 /dev/${prts}
mount /dev/${prts} /mnt
}
echo -e "==================================================="
echo    "=           Menginstall Base System...            ="
echo -e "==================================================="
#script
pacstrap /mnt base base-devel linux linux-firmware linux-headers nano sudo archlinux-keyring wget git libnewt intel-ucode ntfsprogs ntfs-3g dosfstools dos2unix e2fsprogs xfsprogs btrfs-progs --noconfirm --needed
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
arch-chroot /mnt echo "pc" >> /etc/hostname
arch-chroot /mnt echo "127.0.0.1	localhost" >> /etc/hosts
arch-chroot /mnt echo "::1	localhost" >> /etc/hosts
arch-chroot /mnt echo "127.0.1.1	pc.localdomain	pc" >> /etc/hosts

# Add sudo no password rights
arch-chroot /mnt sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

# Add sudo rights
arch-chroot /mnt sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

#Add parallel downloading
arch-chroot /mnt sed -i 's/^#Para/Para/' /etc/pacman.conf

#Enable multilib
arch-chroot /mnt sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
arch-chroot /mnt pacman -Syu --noconfirm
arch-chroot /mnt pacman -S grub networkmanager --noconfirm
arch-chroot /mnt git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..

arch-chroot /mnt grub-install --target=i386-pc /dev/sda
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
echo "Masukkan Root Password "
arch-chroot /mnt passwd
read -p "Masukkan Username :" usrname
echo "Masukkan User Password "
arch-chroot /mnt useradd -mG wheel ${usrname}
arch-chroot /mnt passwd ${usrname}
echo "--------------------------------------------------------"
echo "                  Reboot Ulang..."
echo "--------------------------------------------------------"
sleep 5
rm -rf arch-install
umount -R /mnt
reboot
