#!/bin/bash
set -e

# Get newer keyring from https://kali.download/kali/pool/main/k/kali-archive-keyring/
export KALI_KEYRING=https://kali.download/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2025.1_all.deb
export DEBIAN_FRONTEND=noninteractive

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Install Kali repo
echo 'deb http://kali.download/kali kali-rolling main non-free contrib' > /etc/apt/sources.list
wget -O ./kali-keyring.deb ${KALI_KEYRING}
dpkg -i ./kali-keyring.deb

# Install Kali
apt update
apt upgrade -yq 
apt install -yq kali-defaults

# Enable remote desktop
apt install -yq kali-desktop-xfce tightvncserver xrdp=0.10.1-3.1 xorgxrdp=1:0.10.2-1
systemctl restart xrdp

# Ensure Kali packages stay low priority to avoid mixing Debian/Kali versions
echo -e "Package: *\nPin: origin kali.download\nPin-Priority: 50" | sudo tee /etc/apt/preferences.d/kali

# Refresh profile
source ~/.bashrc

# End message
echo
echo
echo "✅ Installation complete!"
echo
echo "👉 It is important to note that while XRDP provides remote desktop access, additional security measures should be implemented to protect your system."
echo
echo "👉 You can list all available Kali packages using the following commands:"
echo "      apt-cache search kali-tools"
echo "      apt-cache search kali-linux"
echo "      apt-cache search kali-desktop"
echo
echo
