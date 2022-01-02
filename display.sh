case $disp in
1)
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/openbox/openbox.sh
;;
2)
arch-chroot /mnt /usr/bin/runuser -u ${usrname} -- arch-install/plasma/plasma.sh
;;
esac
