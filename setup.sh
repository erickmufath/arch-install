#!/usr/bin/env bash
chmod +x arch-install/*
sh arch-install/base.sh
source arch-install/install.conf
echo -e "==================================================="
echo    "=            Menginstall User Setup...            ="
echo -e "==================================================="
arch-chroot /mnt sh arch-install/1-user-setup.sh
echo -e "==================================================="
echo    "=            Menginstall Root Setup...            ="
echo -e "==================================================="
arch-chroot /mnt sh arch-install/2-root-setup.sh
