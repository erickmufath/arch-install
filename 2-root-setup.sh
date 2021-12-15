echo    "--------------------------------------------------------"
echo -e "            Enabling Login Display Manager"
sed -i 's/^# MAX_SIZE/MAX_SIZE/' /etc/default/zramd
sed -i 's/^8192/${zramd}/' /etc/default/zramd
systemctl enable sddm.service
echo -e "\nSetup SDDM Theme"
cat <<EOF > /etc/sddm.conf
[Theme]
Current=Nordic
EOF
systemctl enable cups
systemctl enable zramd
systemctl enable ntpd.service
systemctl disable dhcpcd.service
systemctl stop dhcpcd.service
systemctl enable NetworkManager.service
systemctl enable bluetooth
echo    "--------------------------------------------------------"
cp -rf arch-install/xorg.conf /etc/X11/
