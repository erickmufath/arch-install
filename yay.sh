cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
yay -S timeshift --noconfirm --needed
