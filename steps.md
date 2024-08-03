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

# Fix locale gen

Edit `/etc/locale.gen` file enabling the locale code you whant then run
```sh
sudo locale-gen
```
