# About sort

```bash
# show help for sort command
sort --help

# result:
Usage: sort [OPTION]... [FILE]...
  or:  sort [OPTION]... --files0-from=F
Write sorted concatenation of all FILE(s) to standard output.

With no FILE, or when FILE is -, read standard input.

```

# Alphabetic Sort
Example we have animal.txt
``` text
cat
dog
elephant
monkey
bear
```

```bash
# show content of animal.txt sorted in alphabetical order.
sort animal.txt

# show content of animal.txt sorted in alphabetical order descending (reverse order).
sort -r animal.txt

# sort then save to file
sort animal.txt -o sorted.txt
sort -r animal.txt -o sorted-reverse.txt

# we can also use redirection stdout to specific file using redirection command
sort animal.txt > sorted.txt
```

# Numeric Sort
Example we have numeric.txt
``` text
12
374
4566
35
9
```

``` bash
sort -n numeric.txt
```

# Distinct / Remove Duplicate Result
```bash
# to get the clue :)
sort --help | grep unique
```

```bash
# remove duplicate result if any
sort -nu numeric.txt
```

> For <code>ls</code>, it has own argument to sort list of files/directories 