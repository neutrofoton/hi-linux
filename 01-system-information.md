# Computer/Host
   ``` bash
   # show the name of the system host.
   $ hostname

   # displays the id of the host of the system.
   $ hostid

   # displays the name with which you are logged in
   $ whoami

   # find the location of source/binary file
   $ whereis xxxx
   ```
# Linux Directory Structure
These are the common top-level directories associated with the root directory:

| Directory |Description                              | 
|:---       | :---                                    | 
|/bin       | binary or executable programs           |
|/etc       | system configuration files              |
|/home      | home directory                          |
|/opt       | optional or third-party software        |
|/tmp       | temporary space, typically cleared on reboot |
|/usr       | User related programs                   |
|/var       | log files                               |

<br/><br/>
Some other directories in the Linux system:
| Directory |Description                              | 
|:---       | :---                                    | 
|/boot      | It contains all the boot-related information files and folders such as conf, grub, etc                          |
|/dev       | It is the location of the device files such as dev/sda1, dev/sda2, etc                          |
|/lib       | It contains kernel modules and a shared library                          |
|/lost+found| It is used to find recovered bits of corrupted files                          |
|/media     | It contains subdirectories where removal media devices inserted                          |
|/mnt       | It contains temporary mount directories for mounting the file system                          |
|/proc      | It is a virtual and pseudo-file system to contains info about the running processes with a specific process ID or PID |
|/run       | It stores volatile runtime data                          |
|/sbin      | binary executable programs for an administrator|
|/srv       | It contains server-specific and server-related files|
|/sys       | It is a virtual filesystem for modern Linux distributions to store and allows modification of the devices connected to the system|


# References
1. https://www.geeksforgeeks.org/linux-directory-structure/