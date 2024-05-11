#/bin/sh
# chroot into myarch
mount -o subvol=@ /dev/nvme1n1p2 /mnt
mount -o subvol=@home /dev/nvme1n1p2 /mnt/home
mount -o subvol=@pkg /dev/nvme1n1p2 /mnt/var/cache/pacman/pkg
mount -o subvol=@log /dev/nvme1n1p2 /mnt/var/log
mount -o subvol=@snapshots /dev/nvme1n1p2 /mnt/.snapshots
mount /dev/nvme1n1p1 /mnt/boot
arch-chroot /mnt

# recreate initramfs
mkinitcpio -p linux
# re-install grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=MyArch --recheck --no-rs-codes --modules="btrfs part_gpt part_msdos"
# update grub
grub-mkconfig -o /boot/grub/grub.cfg
