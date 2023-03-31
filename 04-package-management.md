# Package Format
|Operating System           |Format         | Tools     |
|:---                       | ---           | ---       |
|Debian/Ubuntu              | .deb          |  apt , apt-cache , apt-get , dpkg         | 
|CentOS                     | .rpm          |  yum         |     
|Fedora                     | .rpm          |  dnf         | 
|FreeBSD                    | ports, .txz   |  make, pkg         | 


# Update Package Lists
|Operating System           |Command         |
|:---                       | ---           |
|Debian/Ubuntu              | sudo apt-get update, sudo apt update          |
|CentOS                     | yum check-update          |
|Fedora                     | dnf check-update          |
|FreeBSD                    | Package : sudo pkg update   |
|                           | Ports: sudo portsnap fetch update   |

# Upgrade Installed Packages
|Operating System           |Command                                     | Note     |
|:---                       | ---                                       | ---       |
|Debian/Ubuntu              | sudo apt-get upgrade                      | Only upgrades installed packages, where possible.| 
|                           | sudo apt-get dist-upgrade                 | May add or remove packages to satisfy new dependencies.           | 
|                           | sudo apt upgrade                          | Like apt-get upgrade           | 
|                           | sudo apt full-upgrade                     | Like apt-get dist-upgrade           | 
|CentOS                     | sudo yum update                                      |           |     
|Fedora                     | sudo dnf upgrade                                      |           | 
|FreeBSD (Package)          | sudo pkg upgrade                               |        | 
|FreeBSD (Port)             | less /usr/ports/UPDATING                  | Uses less to view update notes for ports (use arrow kes to scroll, press q to quit).| 
|                           | cd /usr/ports/ports-mgmt/portmaster && sudo make install && sudo portmaster -a                  | Installs portmaster and uses it to update installed ports.| 

# Find a Package
|Operating System           |Command                                     | Note     |
|:---                       | ---                                       | ---       |
|Debian/Ubuntu              | apt-cache search <span style="color:red">search_string</span>    |           | 
|                           | apt search <span style="color:red">search_string</span>          |           | 
|CentOS                     | yum search <span style="color:red">search_string</span>          |           |   
|                           | yum search all <span style="color:red">search_string</span>      | searches all fields, including description|     
|Fedora                     | dnf search <span style="color:red">search_string</span>          |           | 
|                           | dnf search all <span style="color:red">search_string</span>      | searches all fields, including description| 
|FreeBSD (Package)          | pkg search <span style="color:red">search_string</span>          | searches by name| 
|                           | pkg search -f <span style="color:red">search_string</span>       | searches by name, returning full descriptions| 
|                           | pkg search -D <span style="color:red">search_string</span>       | searches description          | 
|FreeBSD (Port)             | cd /usr/ports && make search name=<span style="color:red">package</span>| searches by name          | 
|                           | cd /usr/ports && make search key=<span style="color:red">search_string</span>| searches comments, descriptions, and dependencies| 

# Info of Package
|Operating System           |Command                                     | Note     |
|:---                       | ---                                       | ---       |
|Debian/Ubuntu              | apt-cache show <span style="color:red">package</span>   |           | 
|                           | apt show <span style="color:red">package</span>    |           | 
|                           | dpkg -s <span style="color:red">package</span>    |           | 
|CentOS                     | yum info <span style="color:red">package</span>          |           |   
|                           | yum deplist <span style="color:red">package</span>      | lists dependencies for a package |     
|Fedora                     | dnf info <span style="color:red">package</span>          |           | 
|                           | dnf repoquery --requires <span style="color:red">package</span>      | lists dependencies for a package| 
|FreeBSD (Package)          | pkg info <span style="color:red">package</span>          | shows info for an installed package| 
|FreeBSD (Port)             | cd /usr/ports/<span style="color:red">category</span>/<span style="color:red">port</span> && cat pkg-descr | searches by name          | 


# Install a Package from Repositories
|Operating System |Command                                     | Note     |
|:---             | ---                                       | ---       |
|Debian/Ubuntu    |  sudo apt-get install <span style="color:red">package</span>  |           | 
|                 |  sudo apt-get install <span style="color:red">package1</span> <span style="color:red">package2</span> ...   | install multiple packages | 
|                 |  sudo apt-get install -y <span style="color:red">package</span>  | assumes "yes" where <code>apt</code> would usuall prompt to continue | 
|                 |  sudo apt install <span style="color:red">package</span>  |displays a colored progress ar           | 
|CentOS           | sudo yum install <span style="color:red">package</span>         |           |   
|                 | sudo yum install <span style="color:red">package1</span> <span style="color:red">package2</span> ...      | install multiple packages  |   
|                 | sudo yum install -y <span style="color:red">package</span>      | assumes "yes" where <code>yum</code> would usuall prompt to continue |    
|Fedora           | sudo dnf install <span style="color:red">package</span>          |           | 
|                 | sudo dnf install <span style="color:red">package1</span> <span style="color:red">package2</span>      | | 
|                 | sudo dnf install -y <span style="color:red">package</span>      | assumes "yes" where <code>dnf</code> would usuall prompt to continue| 
|FreeBSD (Package)| sudo pkg install <span style="color:red">package</span>          | | 
|                 | sudo pkg install <span style="color:red">package1</span> <span style="color:red">package2</span> ...          | install multiple packages|
|FreeBSD (Port)   | cd /usr/ports/<span style="color:red">category</span>/<span style="color:red">port</span> && sudo make install | builds and installs a port from source.          | 

# Install a Package from the Local Files System

|Operating System           |Command                                     | Note     |
|:---                       | ---                                       | ---       |
|Debian/Ubuntu              | sudo dpkg -i <span style="color:red">package.deb</span>|           | 
|                           | sudo apt-get install -y <span style="color:red">gdebi</span> && sudo gdebi <span style="color:red">package.deb</span> |  installs and uses gdebi to install package.deb and retrieve any missing dependencies         | 
|CentOS                     | sudo yum install <span style="color:red">package.rpm</span>|           |     
|Fedora                     | sudo dnf install <span style="color:red">package.rpm</span> |           | 
|FreeBSD (Package)          |sudo pkg add <span style="color:red">package.txz</span> |           | 
|                           | sudo pkg add -f <span style="color:red">package.txz</span> |  installs package even if already installed         | 
|                           |                                           |           | 


# Remove One or More Installed Packages

|Operating System           |Command                                     | Note     |
|:---                       | ---                                       | ---       |
|Debian/Ubuntu              | sudo apt-get remove <span style="color:red">package</span> |           | 
|                           | sudo apt remove <span style="color:red">package</span>  |           | 
|                           | sudo apt-get autoremove | removes unneeded packages          | 
|CentOS                     | sudo yum remove <span style="color:red">package</span> |           |     
|Fedora                     | sudo dnf erase <span style="color:red">package</span>|           | 
|FreeBSD (Package)          | sudo pkg delete <span style="color:red">package</span> |     
|                           | sudo pkg autoremove | removes unneeded packages     | 
|FreeBSD (Port)             | sudo pkg delete <span style="color:red">package</span> |           | 
|                           | cd /usr/ports/<span style="color:red">path_to_port</span> && make deinstall |           | 