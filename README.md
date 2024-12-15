# 🧑‍💻 VPS with Kali Desktop

This repository provides a one-line installation script to install:
- Kali Linux default packages
- XRDP (Remote Desktop)

It is important to note that while XRDP provides remote desktop access, additional security measures should be implemented to protect your system. 

## One-line installation
  
> Tested on OVH VPS with Debian 12.

```bash
curl -sSL https://raw.githubusercontent.com/Jaouan/vps-with-kali-desktop/refs/heads/main/install-kali.sh | bash
```

## Install other Kali packages
 
You can list all Kali packages with the following commands:
```bash
apt-cache search kali-tools
apt-cache search kali-linux
apt-cache search kali-desktop
```

Some dependencies of `kali-linux-everything` may be incompatible with the VPS kernel. Therefore, it's preferable to install only the necessary packages. 
