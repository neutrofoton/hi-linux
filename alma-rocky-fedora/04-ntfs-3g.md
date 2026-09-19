```bash
# install ntfs-3g
sudo dnf install ntfs-3g

# create directory for mounting ntfs disk
sudo mkdir /mnt/win

# mount disk
mount -t ntfs-3g /dev/sdb1 /mnt/win
```

# References
- https://www.howtoforge.com/tutorial/mount-ntfs-centos/
