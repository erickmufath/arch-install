 if pacman -Qqe | grep -E "pipewire|easyeffects"; then
    yay -Rnsc pipewire --noconfirm
    yay -Rnsc pipewire-alsa --noconfirm
    yay -Rnsc pipewire-pulse --noconfirm
    yay -Rnsc pipewire-jack --noconfirm
    yay -Rnsc wireplumber --noconfirm
    yay -Rnsc gst-plugin-pipewire --noconfirm
    yay -Rnsc libpipewire02 --noconfirm
    yay -Rnsc pipewire-zeroconf --noconfirm
    yay -Rnsc lib32-pipewire --noconfirm
    yay -Rnsc lib32-pipewire-jack --noconfirm
    yay -Rnsc easyeffects --noconfirm
    ./arch-install/extra-pkgs.sh
    ./arch-install/list-pkgs.sh
fi
sudo pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pulseaudio-lirc pulseaudio-zeroconf lsp-plugins pulsemixer --noconfirm --needed
flatpak install com.github.wwmm.pulseeffects
