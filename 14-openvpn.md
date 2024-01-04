```bash
# install epel-release which is very essential dependency for openvpn
sudo dnf install epel-release

# install openvpn network manager
sudo dnf install NetworkManager-openvpn
```

``` bash
# connect to the open vpn
sudo openvpn VPN-Test.ovpn
```

We can also upload VPN file via GUI. To do that open Setting > Network > Add in the VPN section.