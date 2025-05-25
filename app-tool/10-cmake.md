1. Download CMake at https://github.com/Kitware/CMake/releases/download/v4.0.2/cmake-4.0.2-linux-x86_64.sh
2. Extract it
    ```bash
    tar -xzf cmake-4.0.2-linux-x86_64.tar.gz
    ```

3. Move to the `/opt`
    ```bash
    sudo mv cmake-4.0.2-linux-x86_64 /opt/cmake
    ```

4. Add to env variable (append to `.zshrc`)
    ```bash
    # add to env variable
    echo 'export PATH=/opt/cmake/bin:$PATH' >> ~/.zshrc

    # reload
    source ~/.zshrc
    ```

5. Check cmake version
    ```bash
    cmake --version
    ```