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
