Linux software installation occasionally be a difficult process. If you use one of the classic package managers, like APT or DNF, you may encounter missing libraries. Then, you would have to look for the missing library or dependency and discover that it depends on other dependencies as well. Snap steps in at this point.

Snap is a packaging software for Linux operating systems, developed by Canonical and first released in 2014. Utilizing containerized packages called snaps, it encapsulates an application along with all of its libraries, dependencies, configuration files, and other prerequisites for proper software operation.

We can search through a wide selection of thousands of snaps hosted on the [Snap Store](https://snapcraft.io/store)

# Step installing snap on Almalinux

- Install EPEL repository
    ```bash
    sudo dnf install epel-release
    ```
- Install snap
    ```bash
    sudo dnf install snapd
    ```
- Start the snapd daemon
    ```bash
    sudo systemctl start snapd.socket
    ```

- Enable the service on boot time
    ```bash
    sudo systemctl enable snapd.socket
    ```

- Verify that the snapd daemon is running
    ```bash
    sudo systemctl status snapd.socket
    ```

- We can enable classic snap support by creating a symbolic link from <code>/var/lib/snapd/snap</code> to <code>/snap</code>
    ```bash
    sudo ln -s /var/lib/snapd/snap /snap
    ```

- Check version
    ```bash
    snap --version
    ```

# Using snap to manage snap packages
- Search package. For example skype
    ```bash
    sudo snap find onlyoffice
    ```

- Get detail information about the application such as the Publisher, snap store URL licensing and the description about the application
    ```bash
    sudo snap info onlyoffice-desktopeditors
    ```

- Installing application (named: onlyoffice) via snap
    ```bash
    sudo snap install onlyoffice-desktopeditors
    ```

- Uninstalling application (named: onlyoffice) via snap
    ```bash
    # remove WITHOUT clear the app data
    sudo snap remove onlyoffice-desktopeditors

    # remove AND clear all the app data
    snap remove --purge onlyoffice-desktopeditors
    ```

- List installed Snap applications
    ```bash
    snap list

    # show all include old updated packages.
    # Old packages should be marked as ‘disabled’.
    snap list --all
    ```

- To remove one of the disabled package, there’s a **revision** flag can do the job
    ```
    snap remove chromium --revision=2254
    ```

# Reference
- https://ubuntuhandbook.org/index.php/2021/01/earch-install-remove-snap-apps-command-line/
- https://linuxways.net/red-hat/how-to-enable-snap-on-rocky-linux-almalinux/
- https://snapcraft.io/onlyoffice-desktopeditors