#!/usr/bin/env bash
clear
pacman -Sy --noconfirm pacman-contrib curl --needed
pacman -Sy --noconfirm reflector rsync terminus-font --needed
setfont ter-v22b
#iso=$(curl -4 ifconfig.co/country-iso)
#timedatectl set-ntp true
#reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
chmod +x arch-install/*
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
echo
echo -e "==================================================="
echo -e "  "
lsblk
echo -e "==================================================="
read -p "->] Pilih Drive (Contoh : sda atau nvmen1) = " drive
read -p "=== Enter Untuk Melanjutkan...." a
cfdisk /dev/"${drive}"
clear
echo -e "==================================================="
echo -e "  "
lsblk
echo -e "==================================================="
read -p "->] Pilih Partisi (Contoh : sda1 atau nvmen1p4) = " prts
read -p "=== Enter Untuk Melanjutkan...."
mkfs.ext4 /dev/"${prts}"
mount /dev/"${prts}" /mnt
read -p "=== Enter Jika Tidak Terjadi Error...." he
echo -e "==================================================="
echo    "=           Menginstall Base System...            ="
echo -e "==================================================="
#script
pacman -Sy sed --noconfirm --needed
#Add parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf
#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
#Pacstrap
pacstrap /mnt base base-devel linux linux-firmware linux-headers networkmanager git
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt pacman -Sy pacman-contrib curl --noconfirm --needed
#arch-chroot /mnt pacman -Sy reflector rsync ntp --noconfirm --needed
#arch-chroot /mnt reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
arch-chroot /mnt systemctl enable NetworkManager
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
echo ${hstname} >> /mnt/etc/hostname
echo "127.0.0.1	localhost" >> /mnt/etc/hosts
echo "::1	localhost" >> /mnt/etc/hosts
echo "127.0.1.1	${hstname}.localdomain	${hstname}" >> /mnt/etc/hosts
arch-chroot /mnt pacman -Sy sed --noconfirm

# Add sudo no password rights
arch-chroot /mnt sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

# Add sudo rights
arch-chroot /mnt sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

#Add parallel downloading
arch-chroot /mnt sed -i 's/^#Para/Para/' /etc/pacman.conf

#Enable multilib
arch-chroot /mnt sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

echo "======================================================="
echo "=] 1. BIOS/Legacy"
echo "=] 2. UEFI"
echo "=] 3. HYBRID [Direkomendasikan Untuk Media External]"
echo "======================================================="
read -p ">> Pilih Jenis Boot (1/2/3) : " boot
case $boot in
1)
arch-chroot /mnt pacman -Sy grub --noconfirm
arch-chroot /mnt grub-install --target=i386-pc /dev/"${drive}"
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
arch-chroot /mnt mkinitcpio -p linux
echo "->] Masukkan Root Password "
arch-chroot /mnt passwd
echo "--------------------------------------------------------"
read -p "->] Masukkan Username :" usrname
echo "--------------------------------------------------------"
echo "->] Masukkan User Password "
echo "--------------------------------------------------------"
arch-chroot /mnt useradd -mG wheel ${usrname}
arch-chroot /mnt passwd ${usrname}
echo "--------------------------------------------------------"
echo "                  Reboot Ulang..."
echo "                  Harap Copot Bootable Media..."
echo "--------------------------------------------------------"
read -p "========= ENTER UNTUK MELANJUTKAN....." re
sleep 5
rm -rf arch-install
umount -R /mnt
reboot
;;
2)
arch-chroot /mnt pacman -Sy grub efibootmgr --noconfirm
arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/mnt/boot --boot-directory=/mnt/boot
arch-chroot /mnt grub-mkconfig -o /mnt/boot/grub/grub.cfg
arch-chroot /mnt mkinitcpio -p linux
arch-chroot /mnt pacman -S xf86-video-intel xf86-video-amdgpu xf86-video-ati xf86-video-vesa --noconfirm
echo "->] Masukkan Root Password "
arch-chroot /mnt passwd
echo "--------------------------------------------------------"
read -p "->] Masukkan Username :" usrname
echo "--------------------------------------------------------"
echo "->] Masukkan User Password "
echo "--------------------------------------------------------"
arch-chroot /mnt useradd -mG wheel ${usrname}
arch-chroot /mnt passwd ${usrname}
echo "--------------------------------------------------------"
echo "                  Reboot Ulang..."
echo "                  Harap Copot Bootable Media..."
echo "--------------------------------------------------------"
read -p "========= ENTER UNTUK MELANJUTKAN....." re
sleep 5
rm -rf arch-install
umount -R /mnt
reboot
;;
3)
arch-chroot /mnt pacman -Sy grub efibootmgr --noconfirm
arch-chroot /mnt grub-install --target=i386-pc --boot-directory=/mnt/boot /dev/"${drive}"
arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/mnt/boot --boot-directory=/mnt/boot --removable --recheck
arch-chroot /mnt grub-mkconfig -o /mnt/boot/grub/grub.cfg
arch-chroot /mnt mkinitcpio -p linux
arch-chroot /mnt pacman -S xf86-video-intel xf86-video-amdgpu xf86-video-ati xf86-video-vesa --noconfirm
echo "->] Masukkan Root Password "
arch-chroot /mnt passwd
echo "--------------------------------------------------------"
read -p "->] Masukkan Username :" usrname
echo "--------------------------------------------------------"
echo "->] Masukkan User Password "
echo "--------------------------------------------------------"
arch-chroot /mnt useradd -mG wheel ${usrname}
arch-chroot /mnt passwd ${usrname}
echo "--------------------------------------------------------"
echo "                  Reboot Ulang..."
echo "                  Harap Copot Bootable Media..."
echo "--------------------------------------------------------"
read -p "========= ENTER UNTUK MELANJUTKAN....." re
HOME=arch-chroot /mnt /home
arch-chroot /mnt git clone https://github.com/erickmufath/arch-install
arch-chroot /mnt mv -rf /home/"${usrname}"
sleep 5
rm -rf arch-install
umount -R /mnt
reboot
;;
esac
