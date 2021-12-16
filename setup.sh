#!/usr/bin/env bash
chmod +x arch-install/*
sh arch-install/base.sh
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING USER SETUP"
echo -e "==================================================="
echo    "=            Menginstall User Setup...            ="
echo -e "==================================================="
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- /home/$usrname/arch-install/1-user-setup.sh
echo    "-]-]-]-]-]-]-]-]-]-]-] RUNNING ROOT SETUP"
echo -e "==================================================="
echo    "=            Menginstall Root Setup...            ="
echo -e "==================================================="
arch-chroot /mnt sh arch-install/2-root-setup.sh
