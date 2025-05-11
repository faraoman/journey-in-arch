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

Require `polkit-kde-agent` package installed

Check if polkit kde is installed with `pgrep -af polkit-kde`

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

# List orphaned packages and remove them

```sh
# list packages
pacman -Qqd | pacman -Rsu --print -
# remove packages
pacman -Qtdq | sudo pacman -Rns --noconfirm -
```

# Cleanup packages

```sh
sudo pacman -Sc
```

# Read log of service

```sh
# journalctl -u {service_name}
journalctl -u status archlinux-keyring-wkd-sync.service
```

# Export installed packages

```sh
# all packages
pacman -Qqe > packages.list
# foreign packages
pacman -Qqem > packages.list
# all explicit packages
pacman -Qqen
# all aur
pacman -Qqem
```

# PacAur

```sh
sudo pacman -S git meson fakechroot expac jq gtest
git clone https://aur.archlinux.org/auracle-git.git
cd auracle-git/
makepkg -i
cd ..
git clone https://aur.archlinux.org/pacaur.git
cd pacaur/
makepkg -si
sudo pacman -R meson fakechroot expac jq gtest
```

# Enabled EDITOR environment variabile

User level edit `~/.profile` and `~./bashrc` adding `export EDITOR=nano`

System level edit `/etc/environment` adding `export EDITOR=nano`

# simil rank mirror
https://bbs.archlinux.org/viewtopic.php?id=268187

# RankMirror with reflector
```sh
pacman -S reflector rsync
reflector --country "DE,IT" --latest 10 --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist
```
# Fix Discover (Kde) won't opening by menu also by konsole (QThread exceptions)
Before the execution (konsole) the `export $(dbus-launch)`
Ex:
```sh
export $(dbus-launch)
plasma-discover
# or contracted export $(dbus-launch) && plasma-discover
```

In the KMenu Editor append before the comman "plasma-discover" `export $(dbus-launch)` and it will be "export $(dbus-launch) && plasma-discover" then save the menu.
Also use this in the .bashrc/.zshrc files, `export $(dbus-launch)` as new line

# Bottles won't open
Rebuild/Reinstall this packages:

```sh
pacaur -S python-pathvalidate icoextract patool python-fvs vkbasalt-cli --noedit --noconfirm
```

# Useful shortcut
alias cls='clear'
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias pacman-cleanup='pacman -Qtdq | sudo pacman -Rnsu -'
alias pacman-refresh-mirrors='sudo reflector --country "DE,IT" --latest 10 --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist'
alias pacaur-check-upgrades='pacaur -Qua'
alias yay-check='yay -Qua'
alias ls='ls --color=auto -sh'
## Bash
```sh
echo "alias cls='clear'" >> .bashrc
echo "alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'" >> .bashrc
echo "alias pacman-cleanup='pacman -Qtdq | sudo pacman -Rnsu -'" >> .bashrc
echo "alias pacman-refresh-mirrors='sudo reflector --country "DE,IT" --latest 10 --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist'" >> .bashrc
echo "alias pacaur-check-upgrades='pacaur -Qua'" >> .bashrc
echo "alias yay-check='yay -Qua'" >> .bashrc
echo "alias ls='ls --color=auto -sh'" >> .bashrc
```
## ZSH
```sh
echo "alias cls='clear'" >> .zshrc
echo "alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'" >> .zshrc
echo "alias pacman-cleanup='pacman -Qtdq | sudo pacman -Rnsu -'" >> .zshrc
echo "alias pacman-refresh-mirrors='sudo reflector --country "DE,IT" --latest 10 --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist'" >> .zshrc
echo "alias pacaur-check-upgrades='pacaur -Qua'" >> .zshrc
echo "alias yay-check='yay -Qua'" >> .zshrc
echo "alias ls='ls --color=auto -sh'" >> .zshrc
```

rename hostname='hostnamectl hostname NAME'
change os info = /etc/os-release (https://www.commandlinux.com/man-page/man5/os-release.5.html,https://www.linux.org/docs/man5/os-release.html)
distro name generator = https://codepen.io/semibran/pen/wazzaj
extra pacman utils = sudo pacman -S pacman-contrib
edit pre-login informations = /etc/issue
find file recursively = find /path/to/directory -name "pattern"
