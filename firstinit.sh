timedatectl set-ntp true

fdisk -l
echo "Enter system partition"
read sys_part
echo "Enter swap partition"
read swap_part


mkfs.ext4 /dev/$sys_part


mkswap /dev/$swap_part
swapon /dev/$swap_part


mount /dev/$sys_part /mnt
mkdir /mnt/boot

pacstrap /mnt base

gemfstab -U /mnt >> /mnt/etc/fstab

cp secondinit.sh /mnt/

echo "Now you'll be chroot to your system run \"secondinit.sh\" to complit instalation"


arch-chroot /mnt


cp -r ./Configs.tar.gz /mnt/root/
tar -xzvf /mnt/root/Configs.tar.gz


echo "Now you must reboot, and after run /root/Congis/initSystem.sh"

