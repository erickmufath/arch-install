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
