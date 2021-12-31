read -p "->] Install Lutris For Gaming (y/n) : " gam
case $gam in
y|Y|yes|Yes|YES)
sudo pacman -S gamemode dxvk winetricks lutris giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm --needed
esac
# Graphics Drivers find and install
echo    "--------------------------------------------------------"
echo    ""
echo    "           INSTALLING GRAPHICS DRIVER"
echo    ""
echo    "--------------------------------------------------------"
if lspci | grep -E "NVIDIA|GeForce"; then
    sudo pacman -S nvidia nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm --needed
	nvidia-xconfig
elif lspci | grep -E "Radeon"; then
    sudo pacman -S xf86-video-amdgpu lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm --needed
elif lspci | grep -E "Integrated Graphics Controller"; then
    sudo pacman -S libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader --needed --noconfirm
fi
yay -Syyu --noconfirm
