## Packages
### System
- systemd-sysv
- fonts-dejavu-core
- firmware-amd-graphics
- linux-image-amd64
- xserver-xorg-core
- xserver-xorg-video-amdgpu
- xserver-xorg-input-libinput
- x11-xserver-utils
- xinit
- dbus
- locales
- alsa-utils
- xdg-utils
- file
### Programming
- gcc
- git
- make
- neovim
### dwm
- libxft-dev
- libxinerama-dev
### Chrome
- libgtk-3-0
- libnss3
- libx11-xcb1
### Other
- apulse
- sudo

## Partitions
```
parted /dev/nvme0n1:

    mklabel gpt
    mkpart "EFI system partition" fat32 1MiB 1024MiB
    mkpart "root partition" ext4 1024MiB 128GiB
    mkpart "home partition" ext4 128GiB 100%
    set 1 esp on
```

## Partitions filesystems
```
mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mkfs.ext4 /dev/nvme0n1p3
```

## Root filesystem
```
mount -t ext4 /dev/nvme0n1p2 /mnt
mkdir -p /mnt/{boot,home}
mount -t ext4 /dev/nvme0n1p3 /mnt/home
mount -t vfat /dev/nvme0n1p1 /mnt/boot

debootstrap --variant=minbase --arch=amd64 testing /mnt
```

## Chrooting
```
mount -t efivarfs efivarfs /sys/firmware/efi/efivars

mount -t proc proc /mnt/proc
mount -o rbind /dev /mnt/dev
mount -o rbind /sys /mnt/sys

chroot /mnt /bin/bash
```

## Root and packages
```
passwd

apt-get update
apt-get install --no-install-recommends <packages>
```

## User and groups
```
adduser <user>

usermod -aG sudo <user>
usermod -aG audio <user>
usermod -aG video <user>
usermod -aG input <user>
```

## Hostname, language and date
```
dpkg-reconfigure locales
dpkg-reconfigure tzdata

/etc/hostname:
    <hostname>

/etc/hosts:
    127.0.0.1 localhost
    127.0.0.1 <hostname>
```

## Bootloader
```
bootctl install

/boot/loader/loader.conf:
    default debian
    timeout 3

/boot/loader/entries/debian.conf:
    title Debian Testing
    linux /vmlinuz-<version>-amd64
    initrd /initrd.img-<version>-amd64
    options root=UUID=<UUID of /dev/nvme0n1p2> rw
```

## Fstab
```
blkid >> /etc/fstab:

    # /dev/nvme0n1p1:
    UUID=<UUID>         /boot   vfat    defaults        0       2
    # /dev/nvme0n1p2:
    UUID=<UUID>         /       ext4    defaults        0       1
    # /dev/nvme0n1p3:
    UUID=<UUID>         /home   ext4    defaults        0       2
```

## Wired network
```
systemctl enable systemd-networkd.service

/etc/systemd/network/20-wired.network:
    [Match]
    Name=enp37s0

    [Network]
    DHCP=yes
```

## Wireless network
```
wpa_passphrase <SSID> <Password> > /etc/wpa_supplicant/wpa_supplicant-<IF>.conf

systemctl enable wpa_supplicant@<IF>.service

```

## Font configuration
```
dpkg-reconfigure fontconfig-config
dpkg-reconfigure fontconfig
```

## Spotify, Discord, Teams
```
#!/bin/sh

chrome --app=<URL>
```
