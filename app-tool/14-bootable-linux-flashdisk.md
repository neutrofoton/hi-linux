# Step 1: List Block Bevices (lsblk = ls + blk)

```bash
lsblk

NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0         7:0    0  55.5M  1 loop /var/lib/snapd/snap/core18/2979
loop1         7:1    0     4K  1 loop /var/lib/snapd/snap/bare/5
loop2         7:2    0    74M  1 loop /var/lib/snapd/snap/core22/2193
loop3         7:3    0  55.5M  1 loop /var/lib/snapd/snap/core18/2999
...
...
...
sda           8:0    1   250G  0 disk 
└─sda1        8:1    1   250G  0 part /run/media/neutro/720E-ED96
nvme0n1     259:0    0 931.5G  0 disk 
├─nvme0n1p1 259:1    0 507.8M  0 part /boot/efi
├─nvme0n1p2 259:2    0    16M  0 part 
├─nvme0n1p3 259:3    0 194.8G  0 part # (kemungkinan Windows)
├─nvme0n1p4 259:4    0     1G  0 part /boot
└─nvme0n1p5 259:5    0 735.2G  0 part 
  ├─rl-root 253:0    0    70G  0 lvm  /
  ├─rl-swap 253:1    0   6.8G  0 lvm  [SWAP]
  └─rl-home 253:2    0 658.4G  0 lvm  /home

```

# Step 2: Unmount
```bash
umount /dev/sda1
```

# Step 3: Tulis iso ke FlashDisk
```bash
sudo dd if=Rocky-10.1-x86_64-dvd1.iso of=/dev/sda1 bs=4M status=progress oflag=sync
```

| Parameter       | Fungsi                               |
| --------------- | ------------------------------------ |
| if              | input file (ISO)                     |
| of              | output device                        |
| bs=4M           | block size biar lebih cepat          |
| status=progress | menampilkan progress                 |
| oflag=sync      | memastikan data benar-benar tertulis |

# Step 4: Flush Cache

```bash
sync
```
