clear
chmod +x arch-install/*
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING BASE SETUP"
sh arch-install/base.sh
source arch-install/base.sh
arch-chroot /mnt /usr/bin/runuser -u $usrname -- cd ~/ && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..
arch-chroot /mnt yay -S timeshift --needed
echo    "--------------------------------------------------------"
echo    "=== Membuat Restore Point 1"
echo    "--------------------------------------------------------"
timeshift --create --comments "Awal Install [BASE INSTALL ONLY]"
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING USER SETUP"
arch-chroot /mnt /usr/bin/runuser -u $usrname -- /home/$usrname/arch-install/1-user-setup.sh
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING ROOT SETUP"
arch-chroot /mnt sh arch-install/2-root-setup.sh
echo    "--------------------------------------------------------"
echo    "=== Membuat Restore Point 2"
echo    "--------------------------------------------------------"
timeshift --create --comments "Awal Install [BASE INSTALL + PACKAGES & CONFIGURATION]"
