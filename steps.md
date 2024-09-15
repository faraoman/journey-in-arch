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

# Enable mount disk without root access (KDE-Polkit)

Edit `/usr/share/polkit-1/rules.d/org.freedesktop.UDisks2.rules` file (if not exist, create it) as
```js
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
         action.id == "org.freedesktop.udisks2.filesystem-mount") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
```
# Fix Gnome Button Layout (Minimize,Maximize,Close)

```sh
dconf write /org/gnome/desktop/vm/preferences/button-layout "':minimize,maximize,close'"
```

# Refresh keys and install upgrades

```sh
sudo pacman-key --refresh-keys
sudo pacman -Sy archlinux-keyring --noconfirm
sudo pacman -Syu --noconfirm
```
