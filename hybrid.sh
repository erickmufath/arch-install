arch-chroot /mnt pacman -Sy efibootmgr --noconfirm
grub-install --target=i386-pc --boot-directory=/boot /dev/sda
grub-install --target=x86_64-efi --efi-directory=/boot --boot-directory=/boot --removable --recheck
pacman -S xf86-video-intel xf86-video-amdgpu xf86-video-ati xf86-video-vesa
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
sleep 5
rm -rf arch-install
umount -R /mnt
reboot
