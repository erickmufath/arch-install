git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..
sudo pacman -Syu --needed && sudo pacman-key --refresh-keys --needed && sudo gpg --refresh-keys --needed
chmod +x arch-install/yay.sh
sh yay.sh
echo "--------Setup Keempat Selesai--------"
