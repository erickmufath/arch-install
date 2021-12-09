clear
chmod +x arch-install/*
cp -rf arch-install /mnt/home/${usrname}/
pacman -Sy grub efibootmgr --noconfirm
clear
echo "=] 1. BIOS/Legacy"
echo "=] 2. UEFI"
echo "=] 3. HYBRID [Direkomendasikan Untuk Media External]"
read -p ">> Pilih Jenis Boot (1/2/3) : " boot
case $boot in
1)
sh arch-install/1.sh
sh arch-install/legacy.sh
;;
2)
sh arch-install/1.sh
sh arch-install/uefi.sh
;;
3)
sh arch-install/1.sh
sh arch-install/hybrid.sh
;;
esac
