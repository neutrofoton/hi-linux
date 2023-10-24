# Head

```bash
# head
head filename.txt

# show first 10 lines of text
head -n 10 filename.txt
```

# More
```bash
# more
more filename.txt
```


# Tail

``` bash
#Outputs the last 10 lines of the file myfile.txt.
tail myfile.txt

#Outputs the last 100 lines of the file myfile.txt.
tail myfile.txt -n 100

# Outputs the last 10 lines of myfile.txt, and monitors myfile.txt for updates;
# tail then continues to output any new lines that are added to myfile.txt.
tail -f myfile.txt

# Sample with grep
tail -f access.log | grep 192.168.1.7

# in practical I use
tail -fn 100 log.txt

# tail 
tail filename.txt
tail -f -n 50 filename.txt
```
