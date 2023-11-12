# Install packages needed to use immediately after live install is finished
pacman -S --needed dhcpcd sudo vim nano iwd

# network working in TTL mode
sudo cp -r iwd /etc/iwd
dhcpcd
sudo systemctl enable dhcpcd
sudo systemctl enable iwd
