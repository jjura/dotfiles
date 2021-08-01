## Packages
- sudo
- neovim
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
- libxft-dev
- git
- gcc
- make
- compton

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

## Building dwm
```
make XINERAMALIBS="" XINERAMAFLAGS=""
```
