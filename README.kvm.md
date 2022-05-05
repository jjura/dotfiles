## Packages
### Server
- dbus
- locales
- linux-image-amd64
- qemu-system-x86-64
- qemu-utils
- openssh-server
- systemd-sysv

## Boot options
```
options iommu=pt amd_iommu=on video=efifb:off
options vfio-pci.ids=<vendor>:<device>
```

## Blacklist snd-hda-intel
```
blacklist snd-hda-intel
```

## Download OVMF
```
apt-get -d install ovmf
cp /var/cache/apt/archive/ovmf.deb .
dpkg-deb -x ovmf.deb ovmf
```

## GPU rom
- Download GPU rom from: https://www.techpowerup.com/vgabios
```
wget https://www.techpowerup.com/vgabios/212120/AMD.RX5700XT.8192.190616.rom
```

## KVM AMDGPU reset fix
- Build vendor-reset kernel module:
```
https://github.com/gnif/vendor-reset
```
- Install the kernel inside host:
```
# cp vendor-reset.ko /lib/modules/$(uname -r)/kernel/drivers/gpu
# depmod
# echo "vendor-reset" >> /etc/modules
```
- Make sure GPU's reset method contains correct value:
```
echo "device_specific" > /sys/bus/pci/devices/0000\:2b\:00.0/reset_method
```
