EPEL (Extra Packages for Enterprise Linux) on Enterprise Linux systems such as RHEL, AlmaLinux, Rocky, Oracle, CentOS, and Fedora is a repository to provide additional packages that are not available through the default systems repo such as BaseOS and AppStream.

- Before adding the repository, let’s update our Linux system to get the available security updates and rebuild the DNF package cache.

    ```bash
    sudo dnf update
    ```
- There are some packages in the EPEL repository of Enterprise Linux that need CBR ” Code Ready Builder: repository. Therefore, first, enable it using the given command

    ```bash
    sudo dnf config-manager --set-enabled crb
    ```

- Enabling EPEL and EPEL Next
    ```bash
    # enable EPEL
    sudo dnf install epel-release

    # enable EPEL Next
    sudo dnf install epel-next-release
    ```

- To confirm EPEL is enabled successfully on our Linux system, we can list the active repositories.

    ```bash
    # list active repositories
    dnf repolist

    # list active repositories and filter epel
    dnf repolist | grep epel
    ```