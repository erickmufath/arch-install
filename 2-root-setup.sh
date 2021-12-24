read -p "->] Buat Restore Point Awal Install" shi
rm -rf /mnt/arch-install
source arch-install/install.conf
echo    "--------------------------------------------------------"
echo -e "            Enabling Login Display Manager"
arch-chroot /mnt sed -i 's/^# MAX_SIZE/MAX_SIZE/' /etc/default/zramd
arch-chroot /mnt sed -i 's/^8192/${zramd}/' /etc/default/zramd
arch-chroot /mnt systemctl enable sddm.service
arch-chroot /mnt systemctl enable lightdm
echo -e "\nSetup SDDM Theme"
cat <<EOF > /mnt/etc/sddm.conf
[Theme]
Current=Nordic
EOF
arch-chroot /mnt systemctl enable cups
arch-chroot /mnt systemctl enable zramd
arch-chroot /mnt systemctl enable ntpd.service
arch-chroot /mnt systemctl disable dhcpcd.service
arch-chroot /mnt systemctl stop dhcpcd.service
arch-chroot /mnt systemctl enable NetworkManager.service
arch-chroot /mnt systemctl enable bluetooth
arch-chroot /mnt echo    "--------------------------------------------------------"
cp -rf arch-install/xorg.conf /mnt/etc/X11/
echo    "--------------------------------------------------------"
echo    "=== Membuat Restore Point 2"
echo    "--------------------------------------------------------"
case $shi in
y|Y|yes|Yes|YES)
arch-chroot /mnt timeshift --create --comments "Awal Install [BASE INSTALL + PACKAGES & CONFIGURATION]"
esac
