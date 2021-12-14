sh arch-install/1-setup.sh
echo    "--------------------------------------------------------"
echo    "=== Membuat Restore Point"
echo    "--------------------------------------------------------"
timeshift --create --comments "Awal Install [BASE INSTALL ONLY]"
source arch-install/base.sh
arch-chroot /mnt /usr/bin/runuser -u $usrname -- /home/$usrname/arch-install/2-user-setup.sh
arch-chroot /mnt sh arch-install/3-root-setup.sh
