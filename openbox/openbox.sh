sudo pacman -S rxvt-unicode lxappearance tint2 rofi openbox nitrogen obconf
git clone https://github.com/addy-dclxvi/openbox-theme-collections ~/.themes
rm -rf ~/.config/tint2
git clone https://github.com/addy-dclxvi/tint2-theme-collections ~/.config/tint2 --depth 1
cp ~/.config/tint2/minima/minima.tint2rc ~/.config/tint2/tint2rc
