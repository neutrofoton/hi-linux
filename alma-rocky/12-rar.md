# Manually Install the Official `unrar` RARLab

The `unrar-free` does not support RAR v4 and above.

1. Remove `unrar-free` and EPEL's `unrar`

    ```bash
    sudo dnf remove -y unrar unrar-free

    ```
2. Download the Official unrar from RARLab. Get the latest version directly from RARLab

    ```bash
    curl -O https://www.rarlab.com/rar/rarlinux-x64-623.tar.gz

    ```

3. Extract and Install
    ```bash
    tar -xvzf rarlinux-x64-623.tar.gz
    cd rar
    sudo cp unrar /usr/local/bin/
    sudo chmod +x /usr/local/bin/unrar

    ```

    You can also put your home and register in your shell profile.
    ```bash
    # add rar
    export PATH=$PATH:$HOME/sdk/rar

    ```

4. Verify
    ```bash
    unrar | head -n 2

    # output:
    UNRAR 6.23 freeware      Copyright (c) 1993-2023 Alexander Roshal

    ```

5. Extract your RAR file (`unrar x <file>`).