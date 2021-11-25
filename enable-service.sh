yay -Sy --noconfirm --no-ask-password grub networkmanager network-manager-applet linux-headers bluez cups xdg-utils xdg-user-dirs exfatprogs linux intel-ucode xorg xf86-video-intel sddm plasma xfce4-goodies awesome-terminal-fonts nerd-fonts-source-code-pro ttf-anonymous-pro ttf-bitstream-vera ttf-caladea ttf-carlito ttf-cascadia-code ttf-cormorant ttf-croscore ttf-eurof
ttf-fantasque-sans-mono ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-hector ttf-hellvetica ttf-ibm-plex ttf-inconsolata ttf-jetbrains-mono ttf-joypixels
ttf-lato ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-meslo-nerd-font-powerlevel10k ttf-monofur ttf-ms-fonts ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ttf-opensans ttf-proggy-clean opera adapta-gtk-theme materia-gtk-theme breeze materia-kde ventoy-bin sddm-nordic-theme-git gst-plugin-pipewire libpipewire02 pipewire pipewire-alsa pipewire-jack pipewire-pulse pipewire-zeroconf wireplumber lib32-pipewire lib32-pipewire-jack
echo -e "\nEnabling Login Display Manager"
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
