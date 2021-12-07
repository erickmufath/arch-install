echo "--------------------------------------------------------"
echo "           Setup Bahasa, lokal, Hostname & Hosts        "
echo "--------------------------------------------------------"
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
timedatectl --no-ask-password set-timezone Asia/Jakarta
timedatectl --no-ask-password set-ntp 1
localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_GB.UTF-8"

# Set keymaps
localectl --no-ask-password set-keymap us

# Set hostname & hosts
echo "lynx" >> /etc/hostname
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1	localhost" >> /etc/hosts
echo "127.0.1.1	lynx.localdomain	lynx" >> /etc/hosts

# Add sudo no password rights
sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

# Add sudo rights
sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

#Add parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf

#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Syu --noconfirm

grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo "Masukan Root Password : "
passwd
echo "Masukan User Password : "
useradd -mG wheel lynx
passwd lynx
echo "Saatnya Reboot"
echo "\nJalankan : "
echo "\n1. umount -R /mnt"
echo "\n2. reboot"
exit
