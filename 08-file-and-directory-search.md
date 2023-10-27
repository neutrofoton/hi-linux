
# Grep
``` bash
# search for patthern in file
grep -r {pattern} {directory}
grep -r *.config /etc 

# filter by pattern the output of command
{command} | grep {pattern}
ls -a | grep *config*


```

# Locate
```bash
# find all instances of file
locate {file}
```

# Find

- #### Basic find operation
    ``` bash
    # find file of extension
    find . -type f -name "*.jar"

    # find directory
    find . -type d -name ".DS_Store"

    # find link
    find . -type l -ls
    ```

- #### Advanced find operaton
    ```bash
    # find files that are empty
    find . -type f -empty

    # find files larger than 10KB
    find . -type f -size +10k

    # find file which has permission 777
    find . -type f -perm 777

    # find file or folder which has permission 777
    find . -perm 777
    ```


- #### Custom process execution to the result
  We can redirect <code>stdout</code> of <code>find</code> to <code>stdin</code> of other command using <code>pipe ( | )</code> operator. <br/> <br/>
  We can also redirect <code>find</code> result to specific other command using <code>-exec</code> argument. <br/>
  The process will be executed iterated based on number of find result.

    ```bash
    # find file based on name, the open all of it.
    # cat is command that will be executed.
    # {} will be replaced yg item result. So cat will be iterated as number of item result.
    # ; is end of each cat command. Since ; is system character, it should escaped by \.

    find . -name "*.txt" -exec cat {} \;

    # Other example, find then execute remove
    find . -name "*.py" -exec rm {} \;

    # other example, find then execute ls -li
    find . -name "*.txt" -exec ls -li {} \;

    # additional option (--color) to ls
    find . -name "*.txt" -exec ls -li --color {} \;

    ```
