# Install VS Code from Repository

1. Add the Visual Studio Code Repo key to the system.
    ```bash
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    ```

2. Create vscode.repo file under <code>/etc/yum.repos.d</code> directory
    ```bash
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    ```

3. Update the package cache
    ```bash
    dnf check-update
    ```

4. Install VS Code
    ```bash
    sudo dnf -y install code
    ```