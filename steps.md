# Import ovpn file
```sh
sudo pacman -S networkmanager-openvpn
nmcli connection import type openvpn file file.ovpn
```

# Fix initial Wi-Fi connection to network

If you have NetworkManager and iwctl service both enabled, disable the iwctl service (if enabled)
```sh
systemctl disable iwd.service
```
