yay -Syyu --noconfirm
yay -S zramd --noconfirm --needed
sed -i 's/^#MAX_SIZE/MAX_SIZE/' /etc/default/zramd
yay -S rar --noconfirm --needed
yay -S sndcpy --noconfirm --needed
yay -S ventoy-bin --noconfirm --needed
yay -S sddm-nordic-theme-git --noconfirm --needed
yay -S dxvk-bin --noconfirm --needed
yay -S aic94xx-firmware --noconfirm --needed
yay -S wd719x-firmware --noconfirm --needed
yay -S upd72020x-fw --noconfirm --needed
yay -S nerd-fonts-source-code-pro --noconfirm --needed
yay -S liba52 --noconfirm --needed
yay -S mad --noconfirm --needed
yay -S musepack --noconfirm --needed
yay -S vorbis --noconfirm --needed
yay -S google-chrome --noconfirm --needed
sudo pacman -Sy bluez ttf-caladea ttf-carlito ttf-dejavu flatpak cups xdg-utils xdg-user-dirs exfatprogs intel-ucode unzip ark xorg xf86-video-intel sddm plasma xfce4-terminal nautilus scrcpy mpv elisa awesome-terminal-fonts ttf-anonymous-pro ttf-bitstream-vera ttf-caladea ttf-carlito ttf-cascadia-code ttf-cormorant ttf-croscore ttf-eurof ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-ibm-plex ttf-inconsolata ttf-jetbrains-mono ttf-joypixels ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-monofur ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean firefox adapta-gtk-theme materia-gtk-theme breeze materia-kde dhcpcd kdenlive obs-studio audacity network-manager-applet system-config-printer nano sudo packagekit-qt5 archlinux-keyring wget git libnewt ntfsprogs ntfs-3g dosfstools dos2unix e2fsprogs xfsprogs btrfs-progs libfdk-aac celt lame libmad opus libvorbis opencore-amr speex flac wavpack faac faad2 jasper aom schroedinger libdv x265 x264 libmpeg2 xvidcore libtheora libvpx gstreamer gst-libav --needed
sudo pacman -Syyu --noconfirm
