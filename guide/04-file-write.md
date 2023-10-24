# Copy Content from Buffer to a File in Terminal

```bash
# 1. First copy text or content somewhere, for example browser
# 2. create file using cat without speficy stdin of cat then write to file.
#    The stdin will be input from keyboard.
#    If we do not supply argument to stdin of cat, it will listen to keyboard input for stdin.

cat > large-file.txt

# 3. Paste the text in the terminal.
# 4. CTRL+C to exit 
```


# Cat to Read and Write
``` bash
# read a file
cat file1.txt

# create a file
cat > file1.txt

# join multiple file into a file
cat file1.txt  file2.txt > file3.txt
   
```


# Copy
``` bash
#copy recursively and force override and apply to all
yes|cp -rf /home/userftp/html/site/* /home/user1/html/

```
