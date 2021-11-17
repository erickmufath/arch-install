echo "--------------------------------------------------------"
echo "       Setup Bahasa, lokal, hostname dan host           "
echo "--------------------------------------------------------"
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
timedatectl --no-ask-password set-timezone Asia/Jakarta
timedatectl --no-ask-password set-ntp 1
localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"

# Set keymaps
localectl --no-ask-password set-keymap us

# Add sudo no password rights
sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

#Add parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf

#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Sy --noconfirm

sed -i 'lynx' /etc/hostname
sed -i '127.0.0.1 localhost' /etc/hosts
sed -i '::1 localhost' /etc/hosts
sed -i '127.0.1.1 lynx.localhost lynx' /etc/hosts

pacman -S networkmanager network-manager-applet linux-headers bluez cups xdg-utils xdg-user-dirs
