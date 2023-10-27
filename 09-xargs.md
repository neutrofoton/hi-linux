# <code>xargs</code>

```bash
xargs --help

# Usage: xargs [OPTION]... COMMAND [INITIAL-ARGS]...
# Run COMMAND with arguments INITIAL-ARGS and more arguments read from input.
# ...

```

We can redirect <code>stdout</code> of a command to <code>stdin</code> of other command using <code>pipe ( | )</code> operator. <br/>
```bash
ls | cat

# output
file1.txt
file2.txt
file3.txt
file4.txt
```
On the above example, the <code>stdout</code> of <code>ls</code> is sent to <code>stdin</code> of <code>cat</code>. Then <code>cat</code> will simply **print the list (not read the content)**.

If we want to display the content of file in cat, the file name should be passed as **argument** to the <code>cat</code> command instead of <code>stdin</code>.

``` bash
cat file1.txt file2.txt file3.txt
```

To make <code>stdout</code> of a command (<code>ls</code>) as *argument* of the other command (<code>cat</code>) we can use <code>xargs</code>

```bash
ls | xargs cat

# output
# show all content of ls result (file1.txt file2.txt file3.txt)
```

# <code>find</code> using <code>xargs</code> vs <code>exec</code>