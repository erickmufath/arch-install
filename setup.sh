clear
chmod +x arch-install/*
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING BASE SETUP"
sh arch-install/base.sh
source arch-install/install.conf
arch-chroot /mnt /usr/bin/runuser -u $usrname -- arch-install/yay.sh
arch-chroot /mnt yay -S timeshift --needed
echo    "--------------------------------------------------------"
echo    "=== Membuat Restore Point 1"
echo    "--------------------------------------------------------"
arch-chroot /mnt timeshift --create --comments "Awal Install [BASE INSTALL ONLY]"
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING USER SETUP"
arch-chroot /mnt /usr/bin/runuser -u $usrname -- /home/$usrname/arch-install/1-user-setup.sh
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING ROOT SETUP"
arch-chroot /mnt sh arch-install/2-root-setup.sh
echo    "--------------------------------------------------------"
echo    "=== Membuat Restore Point 2"
echo    "--------------------------------------------------------"
arch-chroot /mnt timeshift --create --comments "Awal Install [BASE INSTALL + PACKAGES & CONFIGURATION]"
