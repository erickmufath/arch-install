git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
clear
echo    "--------------------------------------------------------"
echo    "=] 1. Pulseaudio [Default Kebanyakan Distro]"
echo    "=] 2. Pipewire [Audio Controller Modern]"
echo    "--------------------------------------------------------"
read -p "->] Pilih Audio Controller (1/2) : " audioc
sh arch-install/list-pkgs.sh
case $audioc in
1)
sh arch-install/pulseaudio.sh
;;
2)
sh arch-install/pipewire.sh
;;
esac
;;
echo    "--------------------------------------------------------"
echo    "== Langkah Terakhir Jalankan root-setup"
echo    "--------------------------------------------------------"
