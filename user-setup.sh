git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
echo    "--------------------------------------------------------"
echo    "=] 1. Install Paket Basic (Sangat Minimal)"
echo    "=] 2. Install Paket Standard Minimal"
echo    "--------------------------------------------------------"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
read -p "->] Pilih (1/2) : " usrr
case $usrr in
1)
sudo pacman -Sy bluez ttf-caladea ttf-carlito ttf-dejavu flatpak cups xdg-utils xdg-user-dirs exfatprogs unzip ark xorg sddm plasma xfce4-terminal nautilus mpv awesome-terminal-fonts ttf-anonymous-pro ttf-bitstream-vera ttf-caladea ttf-carlito ttf-cascadia-code ttf-cormorant ttf-croscore ttf-eurof ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-ibm-plex ttf-inconsolata ttf-jetbrains-mono ttf-joypixels ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-monofur ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean firefox adapta-gtk-theme materia-gtk-theme breeze materia-kde dhcpcd network-manager-applet system-config-printer nano sudo packagekit-qt5 archlinux-keyring wget git libnewt ntfsprogs ntfs-3g dosfstools dos2unix e2fsprogs xfsprogs btrfs-progs libfdk-aac celt lame libdca opencore-amr opus speex --noconfirm --needed
sudo pacman -Syyu --noconfirm
yay -S timeshift --needed
yay -S sddm-nordic-theme-git --needed
clear
echo    "--------------------------------------------------------"
echo    "=] 1. Pulseaudio [Default Kebanyakan Distro]"
echo    "=] 2. Pipewire [Audio Controller Modern]"
echo    "--------------------------------------------------------"
read -p "->] Pilih Audio Controller (1/2) : " audioc
case $audioc in
1)
sh arch-install/pulseaudio.sh
;;
2)
sh arch-install/pipewire.sh
;;
esac
echo    "--------------------------------------------------------"
echo    "== SELESAI"
echo    "--------------------------------------------------------"
;;
2)
sudo pacman -Sy bluez ttf-caladea ttf-carlito ttf-dejavu flatpak cups xdg-utils xdg-user-dirs exfatprogs intel-ucode unzip ark xorg xf86-video-intel sddm plasma xfce4-terminal nautilus scrcpy mpv elisa awesome-terminal-fonts ttf-anonymous-pro ttf-bitstream-vera ttf-caladea ttf-carlito ttf-cascadia-code ttf-cormorant ttf-croscore ttf-eurof ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-ibm-plex ttf-inconsolata ttf-jetbrains-mono ttf-joypixels ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-monofur ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean firefox adapta-gtk-theme materia-gtk-theme breeze materia-kde dhcpcd kdenlive obs-studio audacity network-manager-applet system-config-printer nano sudo packagekit-qt5 archlinux-keyring wget git libnewt ntfsprogs ntfs-3g dosfstools dos2unix e2fsprogs xfsprogs btrfs-progs libfdk-aac celt lame libdca opencore-amr opus speex --noconfirm --needed
sudo pacman -Syyu --noconfirm
clear
echo    "--------------------------------------------------------"
echo    "=] 1. Pulseaudio [Default Kebanyakan Distro]"
echo    "=] 2. Pipewire [Audio Controller Modern]"
echo    "--------------------------------------------------------"
read -p "->] Pilih Audio Controller (1/2) : " audiod
case $audioc in
1)
sh arch-install/pulseaudio.sh
;;
2)
sh arch-install/pipewire.sh
;;
esac
yay -S timeshift --needed
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
yay -S google-chrome --needed
echo    "--------------------------------------------------------"
echo    "== SELESAI"
echo    "--------------------------------------------------------"
;;
esac
