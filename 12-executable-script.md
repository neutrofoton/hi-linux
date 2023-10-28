> To make executable script is at the first line is defining which interpreter should be use to execute the file.<br/>
> The line is called **shebang** or **bang**

To get to know where the interpreter (bash in this example) location, just use

``` bash
which bash

# output:
/usr/bin/bash

# if we check
ls -l /bin 

# output
lrwxrwxrwx 1 root root 7 Sep 27 09:52 /bin -> usr/bin

```

So, the <code>/usr/bin/bash</code> is equal <code>/bin/bash</code>. That is why we use <code>/bin/bash</code> in the **shebang** definition.

```bash
#!/bin/bash
```