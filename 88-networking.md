# SCP
``` bash
# copy from remote to local
scp -r user@your.server.example.com:/path/to/foo /home/user/Desktop/

# copy from local to remote
scp -r /home/user/Desktop/ user@server_ip:/path/to/foo

# scp specific port
scp -P 123 myfile.zip myuser@mydomain.com:/home/workspace/myfile.zip

# scp copy directory recursively
scp -P 128 -rp MyFolder myuser@mydomain.com:/home/myuser/MyFolder
```

Parameters:
1. <code>-r</code> → recursive
2. <code>-p</code> → preserves/holds modification times, access times, and modes from the original file.


# SSH
``` bash
# ssh to specific port
ssh user@192.168.1.1 -p 2022
```

## Local Port Forward

<img src="images/ssh-forward-local-port.png" alt=""/>

``` bash
# any access to localhost:6969 will be forward to webserver:80 by the ssh_server
ssh –L 6969:webserver:80 user@ssh_server.com –f -N

```

The parameters are:
- <code>L</code> → specifies local port forwarding
- <code>f</code> → requests ssh to go to background just beforecommand execution,
- <code>N</code> → do not execute a remote command.

## Remote Port Forward
<img src="images/ssh-forward-remote-port.png" alt=""/>

``` bash
# any access to ssh_server:8080 will be forward to localhost:6969 by the ssh_server
ssh –R 8080:localhost:6969 user@ssh_server.com -N

```
The parameters are:
- <code>R</code> → specifies remote port forwarding
- <code>N</code> → do not execute a remote command.

# Netstat
``` bash
#netstat -np <protocol> | find "port #"
netstat -np TCP | find "80"

# show table of all network interfaces
netstat -i
```
# References
- https://ret2rop.blogspot.com/2018/08/port-forwarding-ssh-tunneling.html