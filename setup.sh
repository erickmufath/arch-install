#!/usr/bin/env bash
chmod +x arch-install/*
sh arch-install/base.sh
read -p "Enter Untuk Melanjutkan... " go
echo -e "==================================================="
echo    "=            Menginstall User Setup...            ="
echo -e "==================================================="
sh arch-install/1-user-setup.sh
read -p "Enter Untuk Melanjutkan... " go
echo -e "==================================================="
echo    "=            Menginstall Root Setup...            ="
echo -e "==================================================="
sh arch-install/2-root-setup.sh
