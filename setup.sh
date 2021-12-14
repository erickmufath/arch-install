clear
chmod +x arch-install/*
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING BASE SETUP"
sh arch-install/base.sh
echo    "--------------------------------------------------------"
echo    "=== Membuat Restore Point"
echo    "--------------------------------------------------------"
timeshift --create --comments "Awal Install [BASE INSTALL ONLY]"
source arch-install/base.sh
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING USER SETUP"
arch-chroot /mnt /usr/bin/runuser -u $usrname -- /home/$usrname/arch-install/1-user-setup.sh
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING ROOT SETUP"
arch-chroot /mnt sh arch-install/2-root-setup.sh
echo    "--------------------------------------------------------"
echo    "=== Membuat Restore Point"
echo    "--------------------------------------------------------"
timeshift --create --comments "Awal Install [BASE INSTALL + PACKAGES & CONFIGURATION]"
