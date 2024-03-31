# tar (archieving)
Tar is archieving files or directies into a file. The arguments are:
   - <code>c</code> → create archive
   - <code>t</code> → table of content
   - <code>x</code> → extract
   - <code>f</code> → file name
   - <code>z</code> → use zip/gzip
   - <code>j</code> → use bzip2
   - <code>k</code> → don't override
   - <code>w</code> → ask for confirmation
   - <code>v</code> → verbose

``` bash
# tar file or directory into a file.tar
tar -cf archieve.tar .
tar -cf archieve.tar /home/neutro/mydir

# show list of content of an archieve
tar -tf archieve.tar

# untar into current directory
tar -xf file.tar

```


# gzip (Compression)
``` bash
# compress file.txt and rename to file.txt.gz
gzip file.txt

# compress arhieve.tar. The output will rename existing achieve.tar to archieve.tar.gz
gzip arhieve.tar

# output
arhieve.tar.gz

# decompress file.txt.gz
gzip -d file.txt.gz

# output
file.txt
```

# tar + gzip at once
``` bash
# archive all contents in current directory, the compress it.
# put the result on ~/workspace/archieve.tar.gz
tar -czf ~/workspace/archieve.tar.gz .

# extract the arhieved compressed files to a temp dir
cd temp
tar -xvzf ~/workspace/archieve.tar.gz
tar -xvzf ../archieve.tar.gz

```

# Rar Unrar
Unrar files
``` bash
unrar -x FILE.rar
```

Unrar multiple file
```bash
for z in *.rar
do
   unrar -x $z
done
```
