read -p "Enter Untuk Melanjutkan... " go
clear
source arch-install/install.conf
echo    "--------------------------------------------------------"
echo    "=] 1. Pulseaudio [X11/Wayland]"
echo    "=] 2. Pipewire [Wayland]"
echo    "--------------------------------------------------------"
read -p "->] Pilih Audio Controller (1/2) : " audioc
echo    "--------------------------------------------------------"
echo    "=] 1. Openbox[X11 Only]"
echo    "=] 2. Plasma [X11/Wayland]"
echo    "--------------------------------------------------------"
read -p "->] Pilih DE (1/2) : " disp
read -p "->] Buat Restore Point Base System Only (y/n) : " rbase
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- /home/$usrname/arch-install/yay.sh
case $rbase in
y|Y|yes|Yes|YES)
arch-chroot /mnt timeshift --create --comments "Base Install Only"
;;
esac
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/list-pkgs.sh
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/extra-pkgs.sh
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
case $disp in
1)
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/openbox/openbox.sh
;;
2)
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/plasma/plasma.sh
;;
esac
case $audioc in
1)
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/pulseaudio.sh
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/x11.sh
;;
2)
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/pipewire.sh
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/wayland.sh
;;
esac
