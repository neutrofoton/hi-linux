
# Add user group
``` bash
# Add User to sudo Group
adduser username sudo

# Add user to docker group
sudo usermod -aG docker $USER

# check user group
groups

# test run docker
docker run hello-world
```