sudo pacman -Sy networkmanager network-manager-applet linux-headers bluez ttf-caladea ttf-carlito ttf-dejavu cups xdg-utils xdg-user-dirs exfatprogs linux intel-ucode rar unzip ark xorg xf86-video-intel sddm plasma xfce4-terminal nautilus scrcpy mpv elisa awesome-terminal-fonts nerd-fonts-source-code-pro ttf-hellvecita ttf-anonymous-pro ttf-bitstream-vera ttf-caladea ttf-carlito ttf-cascadia-code ttf-cormorant ttf-croscore ttf-eurof ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-ibm-plex ttf-inconsolata ttf-jetbrains-mono ttf-joypixels ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-meslo-nerd-font-powerlevel10k ttf-monofur ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean opera chromium adapta-gtk-theme materia-gtk-theme breeze materia-kde ventoy-bin sddm-nordic-theme-git gst-plugin-pipewire libpipewire02 pipewire pipewire-alsa pipewire-jack pipewire-pulse pipewire-zeroconf wireplumber lib32-pipewire lib32-pipewire-jack pipewire-jack-replacement alsa-utils dxvk-bin dhcpcd aic94xx-firmware wd719x-firmware upd72020x-fw kdenlive obs-studio audacity easyeffects --needed
sudo pacman -Rnsc pulseaudio pulseaudio-alsa discover jack jack2
sudo pacman -Syyu
