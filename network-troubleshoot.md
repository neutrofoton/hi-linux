```
 sudo arp-scan --localnet
[sudo] password for neutro: 
Sorry, try again.
[sudo] password for neutro: 
Interface: wlo1, type: EN10MB, MAC: cc:5e:f8:1c:62:85, IPv4: 192.168.101.7
Starting arp-scan 1.10.0 with 256 hosts (https://github.com/royhills/arp-scan)
192.168.101.8   00:16:78:32:52:f8       XXXX ELECTRONICS CO., LTD
192.168.101.1   c4:cd:50:76:69:f7       (Unknown)
192.168.101.2   e2:1c:88:3a:75:7c       (Unknown: locally administered)
192.168.101.5   7a:87:92:7c:0d:6f       (Unknown: locally administered)

```

```
sudo nmap -p 1-65535 192.168.101.8

❯ sudo nmap -p 1-65535 192.168.101.8
[sudo] password for neutro: 
Starting Nmap 7.92 ( https://nmap.org ) at 2026-07-11 00:06 WIB
Nmap scan report for 192.168.101.8
Host is up (0.0054s latency).
Not shown: 65534 closed tcp ports (reset)
PORT   STATE SERVICE
23/tcp open  telnet
MAC Address: 00:16:78:32:52:F8 (XXXXX Electronics)

```
