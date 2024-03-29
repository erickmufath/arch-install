#!/usr/bin/env bash
clear
pacman -Sy --noconfirm pacman-contrib curl terminus-font --needed #reflector rsync
setfont ter-v22b
#iso=$(curl -4 ifconfig.co/country-iso)
timedatectl set-ntp true
#reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
clear
echo -e "==================================================="
echo    "=         Selamat Datang Di Scipt Saya            ="
echo    "=     Hati-hati ketika menggunakan script         ="
echo    "=  Tidak Bertanggung Jawab Atas Kehilangan Data   ="
echo    "=    Atau Kerusakan Yang Disebabkan Script        ="
echo "======================================================="
echo "=] 1. BIOS/Legacy"
echo "=] 2. UEFI [Beta Test]"
echo "=] 3. HYBRID [Direkomendasikan Untuk Media External/Beta test]"
echo "======================================================="
read -p ">> Pilih Jenis Boot (1) : " boot
clear
read -p "->] Input Nama Komputer Arch Linux (Contoh : pc atau acer) = " hstname
read -p "->] Input Jumlah ZRAM (Contoh 8192) terhitung satuan Mega Byte = " zramd
if $boot="1" then
lsblk
read -p "->] Input Drive untuk install Bootloader (Contoh : sda) = " drive
fi
clear
echo -e "==================================================="
echo    "=           Menginstall Base System...            ="
echo -e "==================================================="
#script
pacman -Sy sed --noconfirm --needed
#Add parallel downloading
#sed -i 's/^#Para/Para/' /etc/pacman.conf
sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 2/' /etc/pacman.conf
#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
#Pacstrap
pacstrap /mnt base base-devel linux linux-firmware linux-headers networkmanager git
#Confirm Pacstrap Was Installed
pacstrap /mnt base base-devel linux linux-firmware linux-headers networkmanager git
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt pacman -Syyu
arch-chroot /mnt pacman -Sy reflector rsync ntp --noconfirm --needed
#arch-chroot /mnt reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
arch-chroot /mnt systemctl enable NetworkManager
echo "--------------------------------------------------------"
echo "           Setup Bahasa, lokal, Hostname & Hosts        "
echo "--------------------------------------------------------"
arch-chroot /mnt sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
arch-chroot /mnt locale-gen
arch-chroot /mnt timedatectl --no-ask-password set-timezone Asia/Jakarta
arch-chroot /mnt timedatectl --no-ask-password set-ntp 1
arch-chroot /mnt localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_GB.UTF-8"

# Set keymaps
arch-chroot /mnt localectl --no-ask-password set-keymap us

# Set hostname & hosts
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
arch-chroot /mnt sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 2/' /etc/pacman.conf

#Enable multilib
arch-chroot /mnt sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
arch-chroot /mnt -Syyu
#user and grub configuration
clear
echo "--------------------------------------------------------"
echo "->] Input Root Password "
echo "--------------------------------------------------------"
arch-chroot /mnt passwd
clear
echo "--------------------------------------------------------"
read -p "->] Input Username :" usrname
echo "--------------------------------------------------------"
echo "->] Input User Password "
echo "--------------------------------------------------------"
arch-chroot /mnt useradd -mG wheel ${usrname}
arch-chroot /mnt passwd ${usrname}
clear
echo "usrname=$usrname" >> arch-install/install.conf
echo "zramd=$zramd" >> arch-install/install.conf
cp -rf arch-install /mnt/home/"${usrname}"
cp -rf arch-install /mnt
case $boot in
1)
arch-chroot /mnt pacman -Sy grub os-prober --noconfirm
arch-chroot /mnt grub-install --target=i386-pc /dev/"${drive}"
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
;;
2)
arch-chroot /mnt pacman -Sy grub efibootmgr os-prober --noconfirm
arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
;;
3)
arch-chroot /mnt pacman -Sy grub efibootmgr os-prober --noconfirm
arch-chroot /mnt grub-install --target=i386-pc --boot-directory=/boot /dev/"${drive}"
arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --boot-directory=/boot --removable --recheck
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
;;
esac
