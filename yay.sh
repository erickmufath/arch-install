arch-chroot /mnt git clone https://aur.archlinux.org/yay.git
arch-chroot /mnt cd yay
arch-chroot /mnt makepkg -si
arch-chroot /mnt yay -S rar
arch-chroot /mnt yay -S sndcpy
arch-chroot /mnt yay -S ventoy-bin
arch-chroot /mnt yay -S sddm-nordic-theme-git
arch-chroot /mnt yay -S pipewire-jack-replacement
arch-chroot /mnt yay -S dxvk-bin
arch-chroot /mnt yay -S aic94xx-firmware
arch-chroot /mnt yay -S wd719x-firmware
arch-chroot /mnt yay -S upd72020x-fw
arch-chroot /mnt yay -S nerd-fonts-source-code-pro
