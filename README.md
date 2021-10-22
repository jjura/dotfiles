## Packages
### System
- sudo
- locales
- linux-image-amd64
- systemd-sysv
- xserver-xorg-core
- xserver-xorg-video-amdgpu
- xserver-xorg-input-libinput
- x11-xserver-utils
- xinit
- dbus
- alsa-utils
- libavcodec58
### Programming
- gcc
- git
- make
- neovim
### dwm
- libxft-dev
- compton
### Discord
- libxss1
- xdg-utils

## User groups
```
usermod -aG sudo <user>
usermod -aG audio <user>
usermod -aG video <user>
usermod -aG input <user>
```

## Language and timezone
```
dpkg-reconfigure locales
dpkg-reconfigure tzdata
```

## Font configuration
```
dpkg-reconfigure fontconfig-config
dpkg-reconfigure fontconfig
```

## Building dwm
```
make XINERAMALIBS="" XINERAMAFLAGS=""
```
