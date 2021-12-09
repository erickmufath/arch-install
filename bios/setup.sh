pacman -Sy sed --noconfirm --needed
#Add parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf
#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Syu --noconfirm
chmod +x arch-install/1-pacstrap.sh
chmod +x arch-install/setup2.sh
cp -rf arch-install /mnt
sh arch-install/1-pacstrap.sh
echo "--------Setup Pertama Selesai--------"
