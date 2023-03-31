
# Computer/Host
 ``` bash
 # show the name of the system host.
 $ hostname
 # displays the id of the host of the system.
 $ hostid
 
 # display host name info
 $ hostnamectl status
 # set host name
 $ hostnamectl set-hostname "Your New Host Name Here"
 
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


# User Info
``` bash
# display who us online
$ w

 # displays the name with which you are logged in
   $ whoami
```

# Root User and Switch User
``` bash
# substitutes the current user for root in the current shell
$ su

# switch to other user
$ su otheruser

# will give you superuser access, but you will still remain 'yourself' (so to speak).
# so things like ~ will still be your home directory.
$ sudo -s

# It’s essentially the same as just running su in the shell.
# asks for the current user’s password rather than root
# Root is given by requesting the current user’s password, which makes it possible to gain root without the root password.
$ sudo su

# virtually the same as the sudo su command with one exception: it does not directly interact with the root user.
$ sudo -i
```



# Disk and Memory
``` bash
# show disk usage
$ df

# show directory space usage
$ du

# show human readable size in MB or GB
$ du -sh

# display folder size. du (directory usage)
$ du -sh foldername

# show memory and swap usage
$ free
```

``` bash


```


# Services
``` bash
# show all service
$ systemctl list-unit-files    

# show All service of type service
$ systemctl  list-units --type service    

# show All service by mount
$ systemctl  list-units --type mount   

# show httpd service
$ systemctl | grep httpd   
$ systemctl list-units | grep httpd

# check service status
$ systemctl status docker

# enable service
$ systemctl enable docker

# start service docker
$ sudo systemctl start docker

# restart service docker
$ systemctl restart docker

# reload daemon
$ systemctl daemon-reload
```

# Date
``` bash
# show current date and time
$ date 

```

# Process
``` bash
# Task Manager like
$ systemd-cgtop
```

# Application
``` bash
# show possible location of app
$ whereis {app}
$ whereis docker

# show which app will be run by default
$ which {app}
$ which docker
```

# References
1. https://www.geeksforgeeks.org/linux-directory-structure/
2. https://www.maketecheasier.com/differences-between-su-sudo-su-sudo-s-sudo-i/
3. https://apple.stackexchange.com/questions/14623/why-cant-i-run-su-and-how-should-i-do