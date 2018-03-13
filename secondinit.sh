ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc

pacman -S vim

echo "Enter your host name"

read host_name

cat > "/ect/hostname" << EOF
$host_name
EOF

cat > "/etc/hosts" << EOF
127.0.0.1 localhost
::1       localhost
127.0.0.1 $host_name.localdomain $host_name
EOF



mkinitcpio -p linux

passwd

pacman -S grub

echo "Enter your system disk like sdX"

read disk

grub-install --target=i386-pc /dev/$disk

pacman -S iw
pacman -S netctl

exit

