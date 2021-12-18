if pacman -Qqe | grep -E "pulseaudio|pulsemixer|pulseeffects"; then
    sudo pacman -Rnsc pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pulseaudio-lirc pulseaudio-zeroconf --noconfirm
flatpak remove com.github.wwmm.pulseeffects
fi
sudo pacman -S lsp-plugins pulsemixer
yay -S pipewire --noconfirm --needed
yay -S pipewire-alsa --noconfirm --needed
yay -S pipewire-pulse --noconfirm --needed
yay -S pipewire-jack --noconfirm --needed
yay -S wireplumber --noconfirm --needed
yay -S gst-plugin-pipewire --noconfirm --needed
yay -S libpipewire02 --noconfirm --needed
yay -S pipewire-zeroconf --noconfirm --needed
yay -S lib32-pipewire --noconfirm --needed
yay -S lib32-pipewire-jack --noconfirm --needed
yay -S easyeffects --noconfirm --needed
