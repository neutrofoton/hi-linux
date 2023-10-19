# About
When we enter a command, actually we run a specific process. 
For example, when we execute command <code>ls </code> or <code>mkdir</code> actually we run corresponding <code>ls</code> and <code>mkdir</code> process. Once the processes are called, they will start and do their job then stop.

There are also long running processes, such as bash shell, sh shell, etc.

# List Process


### List of Running Process
The following command to get list of process
```bash
ps --help all

# show all process and filter named chrome
ps -e | grep chrome
```

### List of Running Process Interactive Table
```bash
# using top
top
```

The other way is using **htop**
```bash
# install htop
sudo apt install htop

# show htop
htop
```

### Kill Process

```bash
kill PID

# examle
kill 1557
```