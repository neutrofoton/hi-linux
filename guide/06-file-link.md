# Soft Link

```bash
ln -s FILE_ORIGINAL FILE_SOFT_LINK
```
Example:

<img src="../images/softlink.png" alt="" width="70%" height="50%"/>


# Hard Link

```bash
ln -s FILE_ORIGINAL FILE_HARD_LINK
```
Example:

<img src="../images/hardlink.png" alt="" width="70%" height="50%"/>


# Summary

<sub>*Soft vs Hard Link*</sub>
| Item                                          | Soft          | Hard  |
| :---                                          | :---:         | :---: | 
| Modify file link will impact original file    | Yes           |   Yes | 
| Inode (Original vs Link)                      | Different     |   Same | 
| Access Right (Original vs Link)               | Different     |   Same |
| Modified Date Time (Original vs Link)         | Different     |   Same |
| Size (Original vs Link)                       | Different     |   Same | 
| Deleting original impact the link             | Yes           |   No   |  