read -p "Enter Untuk Melanjutkan... " go
clear
source arch-install/install.conf
echo    "--------------------------------------------------------"
echo    "=] 1. Pulseaudio [X11/Wayland]"
echo    "=] 2. Pipewire [Wayland]"
echo    "--------------------------------------------------------"
read -p "->] Pilih Audio Controller (1/2) : " audioc
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- /home/$usrname/arch-install/yay.sh
arch-chroot /mnt timeshift --create --comments "Base Install Only"
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/extra-pkgs.sh
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/list-pkgs.sh
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
case $audioc in
1)
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/pulseaudio.sh
;;
2)
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/pipewire.sh
;;
esac
