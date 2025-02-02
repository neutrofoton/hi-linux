# Count Lines of Code

<code>cloc</code> is a tool that counts blank lines, comment lines, and physical lines of source code in many programming languages.

```bash
# installing
sudo dnf install cloc

# get detail help
cloc --help
```

To use
```bash
cloc <path-to-your-directory>
cloc src

# calculate count line of code in dir src for languange C#
cloc src --include-lang=C#

608 text files.
403 unique files.                                          
862 files ignored.

github.com/AlDanial/cloc v 2.02  T=0.38 s (516.5 files/s, 20990.8 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
C#                             194           1433            387           6064
-------------------------------------------------------------------------------
SUM:                           194           1433            387           6064
-------------------------------------------------------------------------------


```
# References
- https://github.com/AlDanial/cloc

