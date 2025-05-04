## 🔐 Firewall on Linux: Rocky Linux vs Ubuntu

| Category            | Rocky Linux (RHEL-based)                          | Ubuntu (Debian-based)                         |
|---------------------|---------------------------------------------------|-----------------------------------------------|
| Default Firewall    | `firewalld`                                       | `ufw` (Uncomplicated Firewall)                |
| Backend             | `iptables` or `nftables`                          | `iptables`                                    |
| Configuration Type  | Dynamic (rules applied instantly)                 | Static (requires reload or enable)            |
| Zone Management     | ✅ Yes (zone-based control)                        | ❌ No                                          |
| GUI Support         | ✅ Yes (`firewall-config`, Cockpit)                | ✅ Yes (`gufw`)                                |
| Rich Rules Support  | ✅ Yes (advanced options like services, IP sets)   | ❌ Limited                                     |
| Tooling CLI         | `firewall-cmd`                                    | `ufw`                                          |
| Use Case Fit        | Best for servers and enterprise networks          | Best for desktops and simple server setups     |


## 🔥 UFW vs Firewalld Overview

| Feature               | `ufw` (Uncomplicated Firewall) | `firewalld`                            |
|-----------------------|-------------------------------|----------------------------------------|
| OS Compatibility      | Ubuntu / Debian                | Rocky / RHEL / Fedora / CentOS         |
| Backend               | `iptables`                     | `iptables` or `nftables`               |
| Configuration         | Static                         | Dynamic                                |
| Zones                 | ❌ No                           | ✅ Yes                                  |
| Rich Rules            | ❌ Limited                     | ✅ Yes (advanced rule options)         |
| IPv6 Support          | ✅ Yes                          | ✅ Yes                                  |
| GUI Available         | ✅ Yes (`gufw`)                 | ✅ Yes (`firewall-config`, Cockpit)    |
| Ease of Use           | ✅ Very simple                  | ⚠️ Moderate complexity                 |


## UFW Example (Ubuntu/Debian)
```bash
# Allow HTTP
sudo ufw allow 80/tcp

# Deny SSH
sudo ufw deny ssh

# Enable firewall
sudo ufw enable

```

##  firewalld Example (Rocky Linux / RHEL)
```bash
# Start firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld

# Allow HTTP in public zone
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload

# View active zones
sudo firewall-cmd --get-active-zones

```