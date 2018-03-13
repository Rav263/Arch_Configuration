#! /bin/bash

echo "You must have internet connection"
echo "Enter your connection type wifi/lan"

read connection_type

if [ $connection_type == 'wlan' ]
then
  echo "Chouse your network"
  wifi-menu
else
  ip link
  echo "enter your internet device like enp3s0"
  read int_dev
  dhcpcd $int_dev
fi

echo "Enter your user name"
read user_name

useradd -m -g wheel -s /bin/bash $user_name
passwd $user_name

pacman -S sudo
cp ./sudoers /etc/sudoers


cp ./pacman.conf /etc/pacman.conf
cp /etc/pacman.d/mirrorlist /etc/mirrorlist.back
cp ./mirrorlist /etc/pacman.d/mirrorlist

pacman -S xorg
pacman -S xorg-xinit
pacman -S xterm
pacman -S i3
pacman -S nvidia

nvidia-xconfig

cp ./locale.gen /etc/locale.gen
locale-gen


pacman -S ttf-dejavu
pacman -S terminus-font

cp ./vconsole.conf /etc/vconsole.conf
cp ./.bashrc ~/.bashrc
cp ./.bashrc /home/$user_name/.bahrc
cp ./.vimrc ~/.vimrc
cp ./.vimrc /home/$user_name/.vimrc

pacman -S git

cp ./.Xresources ~/
cp ./.Xresources /home/$user_name/
cp -r i3 ~/.config/
cp -r i3 /home/$user_name/.config/

pacman -S htop

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

pacman -S feh
cp ./xinitrc /etc/X11/xinit/

pacman -S dmenu
pacman -S firefox
pacman -S gcc
pacman -S lib32-gcc-libs

pacman -S nasm
pacman -S alsa
pacman -S ntfs-3g

cp ./initlan.sh ../
cp ./initlan.sh /home/$user_name

cp ./00-keyboard.conf /etc/X11/xorg.conf.d/

echo "Now you'll be log in with your user, and you must run secondInitSystem.sh"

su $user_name

echo "Now you must reboot"
