sudo pacman -Sy bluez ttf-caladea ttf-carlito ttf-dejavu cups xdg-utils xdg-user-dirs exfatprogs linux intel-ucode unzip ark xorg xf86-video-intel sddm plasma xfce4-terminal nautilus scrcpy mpv elisa awesome-terminal-fonts ttf-anonymous-pro ttf-bitstream-vera ttf-caladea ttf-carlito ttf-cascadia-code ttf-cormorant ttf-croscore ttf-eurof ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-ibm-plex ttf-inconsolata ttf-jetbrains-mono ttf-joypixels ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-monofur ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean opera chromium adapta-gtk-theme materia-gtk-theme breeze materia-kde alsa-utils dhcpcd kdenlive obs-studio audacity celt lame libdca opencore-amr opus speex easyeffects --noconfirm --needed
sudo pacman -Syyu --noconfirm
git clone https://aur.archlinux.org/yay.git
yay -S rar --needed
yay -S sndcpy --needed
yay -S ventoy-bin --needed
yay -S sddm-nordic-theme-git --needed
yay -S dxvk-bin --needed
yay -S aic94xx-firmware --needed
yay -S wd719x-firmware --needed
yay -S upd72020x-fw --needed
yay -S nerd-fonts-source-code-pro --needed
yay -S liba52 --needed
yay -S mad --needed
yay -S musepack --needed
yay -S vorbis --needed
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
