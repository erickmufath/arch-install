echo    "--------------------------------------------------------"
echo -e "            Enabling Login Display Manager"
systemctl enable sddm.service
echo -e "\nSetup SDDM Theme"
cat <<EOF > /etc/sddm.conf
[Theme]
Current=Nordic
EOF
systemctl enable cups
systemctl enable ntpd.service
systemctl disable dhcpcd.service
systemctl stop dhcpcd.service
systemctl enable NetworkManager.service
systemctl enable bluetooth
echo    "--------------------------------------------------------"
cp -rf arch-install/xorg.conf /etc/X11/
echo    "--------------------------------------------------------"
echo    "=== Membuat Restore Point"
echo    "--------------------------------------------------------"
timeshift --create --comments "Awal Install + Packages"