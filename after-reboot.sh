git clone https://aur.archlinux.org/yay.git
yay -S rar
yay -S sndcpy
yay -S ventoy-bin
yay -S sddm-nordic-theme-git
yay -S pipewire-jack-replacement
yay -S dxvk-bin
yay -S aic94xx-firmware
yay -S wd719x-firmware
yay -S upd72020x-fw
yay -S nerd-fonts-source-code-pro
yay -S liba52
yay -S mad
yay -S musepack
yay -S vorbis
echo    "--------------------------------------------------------"
echo -e "       Enabling Login Display Manager"
sudo systemctl enable sddm.service
sudo echo -e "\nSetup SDDM Theme"
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
echo    "--------------------------------------------------------"
echo    "--------------------------------------------------------"
echo    "=] 1. Pulseaudio [Default Kebanyakan Distro]"
echo    "=] 2. Pipewire [Audio Controller Modern]"
echo    "--------------------------------------------------------"
read -p "->] Pilih Audio Controller (1/2) : " audioc
case $audioc in
1)
sh pulseaudio.sh
;;
2)
sh pipewire.sh
;;
esac
