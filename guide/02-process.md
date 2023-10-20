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

# show process using htop filter for specific user
htop -u neutro
htop --user=neutro 
```

### Kill Process

```bash
kill PID

# examle
kill 1557
```

# Data Stream of Process
Every process has 3 data stream.
- <code>stdin</code>
- <code>stdout</code>
- <code>stderr</code>

<img src="../images/stdin-stdout-stderr.png" alt="" width="70%" height="50%"/>

The cycle of process that is called from terminal is :
- The data input from keyboard
- The data will pass through <code>stdin</code> of shell
    ```bash
    # example normal command
    $ ls

    # example bad command
    # mkdir without specify directory name.
    $ mkdir
    ```
- The <code>stdin</code> shell will pass through data to the <code>stdin</code> of process
- If the command is valid, the process will response through the <code>stdout</code>. But if the command is invalid, the process will response through the <code>stderr</code>.

- By deafult the response of process <code>stdout</code> or <code>stderr</code> will be received by shell <code>stdout</code> or <code>stderr</code>. 

- We can redirect the output of <code>stdout</code> or <code>stderr</code> to file.
    ```bash
    # redirect stdout
    $ ls > output-normal.txt

    # redirect stderr
    $ mkdir 2> output-err.txt
    ```