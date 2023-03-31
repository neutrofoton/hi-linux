# Network Interface
Setelah mengaktifkan network interface, misal: di virtual box, pastikan network interfacenya terconfigurasi di debian di <code>/etc/network/interfaces</code>

> reference : 
> https://unix.stackexchange.com/questions/37122/virtualbox-two-network-interfaces-nat-and-host-only-ones-in-a-debian-guest-on

``` bash
# 
# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug enp0s3
iface enp0s3 inet dhcp

allow-hotplug enp0s8
iface enp0s8 inet dhcp

allow-hotplug enp0s9
iface enp0s9 inet dhcp

```
**Catatan:**
>  <br/>
> enp0s8, enp0s9 bisa jadi beda antar kompter. 
> cek dulu di command prompt network interface yg terdetect
> <br/>
>
> ``` bash
> $ ip a
>```
> Setelah menmbuat config spt diatas, aktifkan interface confignya 