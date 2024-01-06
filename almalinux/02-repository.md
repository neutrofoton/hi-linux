To show all repository installed on AlmaLinux

```bash
 # list active repositories
dnf repolist
```

# EPEL (Extra Packages for Enterprise Linux)
EPEL on Enterprise Linux systems such as RHEL, AlmaLinux, Rocky, Oracle, CentOS, and Fedora is a repository to provide additional packages that are not available through the default systems repo such as BaseOS and AppStream.

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

# RPM Fusion repositories 

- Enabling the Free repository
    ```bash
    dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    ```

- Enabling the NON free repository (Optional)
    ```bash
    dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    ```

# ELRepo
```bash
# ELRepo for RHEL-9
yum install https://www.elrepo.org/elrepo-release-9.el9.elrepo.noarch.rpm
```

# References
- https://docs.fedoraproject.org/en-US/quick-docs/rpmfusion-setup/
- https://wiki.almalinux.org/repos/AlmaLinux.html
- https://elrepo.org/tiki/HomePage