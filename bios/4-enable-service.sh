chmod +x arch-install/setup4.sh
echo -e "\nEnabling Login Display Manager"
sudo systemctl enable sddm.service
echo -e "\nSetup SDDM Theme"
sudo cat <<EOF > /etc/sddm.conf
[Theme]
Current=Nordic
EOF
sudo systemctl enable cups
sudo systemctl enable ntpd.service
sudo systemctl disable dhcpcd.service
sudo systemctl stop dhcpcd.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable bluetooth
sudo su
