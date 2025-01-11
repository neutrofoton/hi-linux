1. Make sure it does not block ports 80 and 443.
    ```bash
    sudo firewall-cmd --permanent --add-service={http,https}
    sudo firewall-cmd --reload
    ```

2. Enable COPR (Cool Other Package Repo) Repository
    ```bash
    sudo dnf install 'dnf-command(copr)'

    sudo dnf copr enable @caddy/caddy
    ``` 

3. Install Caddy WebServer
    ```bash
    sudo dnf install caddy
    ```

4. Enable and Start Caddy’s Service

    ```bash
    # enable caddy service
    sudo systemctl enable caddy

    # start caddy service
    sudo systemctl start caddy

    # get caddy service status
    # it will also show location caddy config
    sudo systemctl status caddy
    ```

5. Check the caddy config
    ``` bash
    cat /etc/caddy/Caddyfile
    ```

6. Open browser
    ```bash
    http://localhost
    ```