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
arch-chroot /mnt
