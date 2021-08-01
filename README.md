PACKAGES
================================================================================
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

USER GROUPS
================================================================================
usermod -aG sudo <user>
usermod -aG audio <user>
usermod -aG video <user>
usermod -aG input <user>

LANGUAGE AND TIMEZONE
================================================================================
dpkg-reconfigure locales
dpkg-reconfigure tzdata

DWM BUILD
================================================================================
make XINERAMALIBS="" XINERAMAFLAGS=""
