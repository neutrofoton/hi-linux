#  lsblk
lsblk (list block devices) is used to list information of all available block devices, such as hard disk, and flash drives.

```bash
lsblk
```

# df
The df command is used to list the amount of disk space available as a whole. 

Default df command prints device name, total blocks, used disk space, available disk space, percentage of used space, filesystem mount point, and also prints the remote-mounted filesystems such as NFS.

```bash
# -h means for human readable
sudo df -h
```

# fdisk
The fdisk command is a text-based utility used to manage disk partitions. Using fdisk you can list disk partitions, create a new partition, delete an existing hard disk partition and view the size of the partition.

```bash
# view all available disk partitions
sudo fdisk -l
```

# References
- https://linuxopsys.com/topics/how-to-list-disks-in-linux
