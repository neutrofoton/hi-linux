# SCP
``` bash
# copy from remote to local
$ scp -r user@your.server.example.com:/path/to/foo /home/user/Desktop/

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