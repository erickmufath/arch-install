clear
chmod +x arch-install/*
echo "=] 1. BIOS/Legacy"
echo "=] 2. UEFI"
echo "=] 1. HYBRID [Direkomendasikan Untuk Media External]"
read -p ">> Pilih Jenis Boot : " boot
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
cp -rf arch-install /mnt
