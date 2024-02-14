# Base64 

### Encode-Decode for Text Data
```bash
# encode
# if the first operand is -n, it shall be treated as a string, not an option
# -n here will avoid echo print new line.
echo -n 'neutrofoton' | base64
```

```bash
# decode
echo 'bmV1dHJvZm90b24=' | base64 --decode
```

### Encode-Decode for Text File
```bash
# encode
base64 sample.txt > encodedData.txt
```

```bash
# decode
base64 -d encodedData.txt
base64 --decode encodedData.txt > originalData.txt
```

### Wrap in Bash Script

```bash
#!/bin/bash
echo "Enter Some text to encode"
read text
etext=`echo -n $text | base64`
echo "Encoded text is : $etext"
```
# Environtment Variable

```bash
# print environment variables
printenv
```
# Reference
- https://stackoverflow.com/questions/37563795/base64-encode-gives-different-result-on-linux-centos-terminal-and-in-java
- https://pubs.opengroup.org/onlinepubs/9699919799/utilities/echo.html
- https://linuxhint.com/bash_base64_encode_decode/
