# Install SSH Server

- Installing OpenSSH server
    ```bash
    sudo apt update
    sudo apt install openssh-server
    sudo systemctl enable --now ssh
    ```

- Check ssh service status
    ```bash
    sudo systemctl status ssh
    ```

# Ubuntu Firewall Blocking Port 22

- Checking the firewall blocking
    ```bash
    sudo ufw status
    ```

- Allow SSH in firewall
    ```bash
    sudo ufw allow ssh
    ```