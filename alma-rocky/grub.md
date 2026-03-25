# Restoring Grub 

```bash
# Masuk ke flashdisk bootloader (F2/F12 saat boot)

Troubleshooting → Rescue a Rocky Linux system
Pilih 1. continue

masuk ke chroot /mnt/sysroot
$ chroot /mnt/sysroot

# cek partisi EFI
$ ls /boot/efi/EFI

# connect wifi
nmcli device status
nmcli device connect wlo1 # fail

nmcli device wifi list
nmcli device wifi connect "NAMA_WIFI" password "PASSWORD"

$ ping google.com

#jika error
$ echo "nameserver 8.8.8.8" > /etc/resolv.conf

$ dnf install grub2-efi-x64 grub2-efi-x64-modules shim -y

$ grub2-mkconfig -o /boot/grub2/grub.cfg

$ lsblk -f
nvme0n1
├─nvme0n1p1 vfat   FAT32   XXXX-XXXX   /boot/efi   ✅ INI YANG KITA CARI
├─nvme0n1p2 xfs               xxxx     /
├─nvme0n1p3 swap              xxxx     [SWAP]


$ efibootmgr -c -d /dev/nvme0n1 -p 1 -L "Rocky Linux" -l '\EFI\rocky\shimx64.efi'

$ cp /boot/efi/EFI/rocky/shimx64.efi /boot/efi/EFI/BOOT/BOOTX64.EFI

# check verify
$ efibootmgr -v

# exit
$ exit
 
```
