# Shell, Terminal and Command
Terminal is one of application on Linux system. ITerm2 is one of Terminal emulator. 
Inside the terminal, we connect to a specific process inside a linux computer. 
The process we connect to is a bash process. Bash is a linux shell. Shell is an interpreter for linux command. For example

```bash
    $ ls
```

The command is writen in a terminal application. When enter is pressed, the command is sent to the an interpreter (bash shell). The linux return list of files and directories as a result. The result is displayed on the terminal application 

Diffrent shell may interprete command diffrently. For example : Bourne shell (sh)

   
<img src="../images/command-to-shell.png" alt="" width="70%" height="50%"/>

``` bash
# run and interactive using s
docker run -it ubuntu sh
```

To know what kind of shell we use, we can check using one of the following command. Some shell may use different command.
```bash
# for bash, zsh 
echo $SHELL

# for sh
echo $0
```

# Linux information

### About Linux Operating System
``` bash
uname --help

# get detail
uname -a
```

### Account
```bash
# show user login
w
```

### Linux Command
All linux command executed from Terminal are registered on environtment variable.
```bash
echo $PATH
```

To find out which executable file will be executed by linux
```bash
which mkdir

# output:
# /usr/bin/mkdir
```

Installing linux manual if <code>man</code> command is not found.
```bash
sudo apt install man-db
```

#### Command Option and Argument
Some options may have mandatory argument, but some not. 
In the manual it is shown as

- No need argument in OPTION
    ```bash
    # show node hostname and processor
    uname -n -p

    # the above command can be simplified as
    uname -np
    ```

- NOT Mandatory argument. In documentation it is marked as <code>[ ]</code>

    ``` bash
    --option=[STRING] 

    # example date
    --iso-8601[=FMT]
    ```

    ```bash
    date --iso-8601

    # Output:
    # 2023-10-15
    ```
    

- Mandatory argument
    ``` bash
    --option=STRING 

    # example date
    -d, --date=STRING
    ```

    ``` bash
    # long version (using =)
    date --date='@2147483647'
    date --date=@2147483647

    # short version (using space)
    date -d '@2147483647'
    date -d @2147483647
    

    # both output:
    # Tue Jan 19 10:14:07 AM WIB 2038

    ```

    > If we have space on the argument better put quote sign (<code>' '</code>)
    


# References
- https://www.tutorialspoint.com/unix/unix-what-is-shell.htm
- https://www.tutorialspoint.com/unix/shell_scripting.htm
