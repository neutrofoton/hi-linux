1. Check if firewall is running

    ``` bash
    sudo systemctl status firewalld
    ```

    If it’s not running, start it with:
    ``` bash
    sudo systemctl start firewalld

    ```

2. Open the desired port

    Replace PORT_NUMBER with the port number you want to open, and tcp or udp depending on the protocol.

    ``` bash
    sudo firewall-cmd --zone=public --add-port=PORT_NUMBER/tcp --permanent


    # example: open port 8080 for TCP:
    sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent

    ```

3. Reload the firewall to apply the changes

    ```bash
    sudo firewall-cmd --reload
    ```

4. Verify that the port is open:

    ```bash
    sudo firewall-cmd --zone=public --list-ports

    ```

# Additional Information:
1. Temporarily Opening a Port

    If you want to open the port temporarily (it will close after a reboot or reload):
    ``` bash
    sudo firewall-cmd --zone=public --add-port=PORT_NUMBER/tcp

    ```

2. Opening a Port for a Specific Service

    ``` bash
    sudo firewall-cmd --zone=public --add-service=SERVICE_NAME --permanent

    # example
    sudo firewall-cmd --zone=public --add-service=http --permanent

    ```

3. Remove opened port
    ``` bash
    sudo firewall-cmd --zone=public --remove-port=PORT_NUMBER/tcp --permanent
    ```