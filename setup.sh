clear
pacman -Sy --noconfirm pacman-contrib curl --needed
pacman -Sy --noconfirm reflector rsync terminus-font --needed
setfont ter-v22b
iso=$(curl -4 ifconfig.co/country-iso)
timedatectl set-ntp true
reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
chmod +x arch-install/*
cp -rf arch-install /mnt/home/${usrname}/
clear
echo "======================================================="
echo "=] 1. BIOS/Legacy"
echo "=] 2. UEFI"
echo "=] 3. HYBRID [Direkomendasikan Untuk Media External]"
echo "======================================================="
read -p ">> Pilih Jenis Boot (1/2/3) : " boot
case $boot in
1)
sh arch-install/base.sh
arch-chroot /mnt pacman -Sy grub --noconfirm
sh arch-install/legacy.sh
;;
2)
sh arch-install/base.sh
arch-chroot /mnt pacman -Sy grub efibootmgr --noconfirm
sh arch-install/uefi.sh
;;
3)
sh arch-install/base.sh
arch-chroot /mnt pacman -Sy grub efibootmgr --noconfirm
sh arch-install/hybrid.sh
;;
esac
