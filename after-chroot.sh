echo "--------------------------------------------------------"
echo "                  Setup Bahasa & lokal                  "
echo "--------------------------------------------------------"
echo "-----Setelah ini setting hosts dan hostname manual------"
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
timedatectl --no-ask-password set-timezone Asia/Jakarta
timedatectl --no-ask-password set-ntp 1
localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_GB.UTF-8"

# Set keymaps
localectl --no-ask-password set-keymap us

# Add sudo no password rights
sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

# Add sudo rights
sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

#Add parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf

#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Sy --noconfirm

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd 
yay -Sy --noconfirm --no-ask-password grub networkmanager network-manager-applet linux-headers bluez cups xdg-utils xdg-user-dirs exfatprogs linux intel-ucode xorg xf86-video-intel sddm plasma xfce4-goodies awesome-terminal-fonts nerd-fonts-source-code-pro ttf-anonymous-pro ttf-bitstream-vera ttf-caladea ttf-carlito ttf-cascadia-code ttf-cormorant ttf-croscore ttf-eurof
ttf-fantasque-sans-mono ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-hector ttf-hellvetica ttf-ibm-plex ttf-inconsolata ttf-jetbrains-mono ttf-joypixels
ttf-lato ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-meslo-nerd-font-powerlevel10k ttf-monofur ttf-ms-fonts ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ttf-opensans ttf-proggy-clean opera adapta-gtk-theme materia-gtk-theme breeze materia-kde ventoy-bin sddm-nordic-theme-git
