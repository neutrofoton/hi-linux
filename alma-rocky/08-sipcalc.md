# Compiling <code>sipcalc</code> from Source

1. Install dependencies
    ```bash
    sudo dnf groupinstall "Development Tools" -y  
    sudo dnf install wget -y  
    ```

2. Download source, extract and navigate
    ```bash
    wget http://www.routemeister.net/projects/sipcalc/files/sipcalc-1.1.6.tar.gz

    tar -xzvf sipcalc-1.1.6.tar.gz  
    cd sipcalc-1.1.6
    ```
3. Compile and install
    ```bash
    ./configure  
    make  
    sudo make install  
    ```

4. Verify installation
    ```bash
    sipcalc -V
    ```