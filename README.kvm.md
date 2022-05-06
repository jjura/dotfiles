## Packages
- dbus
- locales
- linux-image-amd64
- qemu-system-x86-64
- qemu-utils
- openssh-server
- systemd-sysv

## qemu-img
```
qemu-img create -f qcow2 debian-testing.qcow2 256G
```

## qemu-system-x86_64 for Linux
```
qemu-system-x86_64 \
        -nodefaults \
        -enable-kvm \
        -cpu host,kvm=off \
        -nographic \
        -machine pc-q35-7.0 \
        -m 8G \
        -smp 16,sockets=1,cores=8,threads=2 \
        -drive if=virtio,file=/home/lucas/Disks/debian-testing.qcow2 \
        -drive if=pflash,format=raw,readonly=on,file=/home/lucas/Bios/OVMF_CODE.fd \
        -drive if=pflash,format=raw,file=/home/lucas/Bios/OVMF_VARS.fd \
        -device pcie-root-port,id=pcie.1,bus=pcie.0 \
        -device vfio-pci,host=2b:00.0,bus=pcie.1 \
        -device vfio-pci,host=2b:00.1,bus=pcie.1 \
        -usb -device usb-host,vendorid=0x046d,productid=0xc52b \
        -usb -device usb-host,vendorid=0x1038,productid=0x12aa \
        -nic user,model=virtio-net-pci \
        -vga none 
```

## qemu-system-x86_64 for Windows
1. Download virtio drivers for Windows:
```
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
```
2. Use additional qemu parameters to install Windows:
```
-drive media=cdrom,file=virtio-win.iso \
-drive media=cdrom,file=windows-10-ltsc.iso \
-nic user,model=e1000 \
-vnc 192.168.0.101:0 \
-vga qxl
```

## vfio-pci
```
/boot/loader/entries/debian.conf:
options iommu=pt amd_iommu=on video=efifb:off
options vfio-pci.ids=<vendor>:<device>

/etc/modules:
vfio-pci
```

## vendor-reset
```
git clone https://github.com/gnif/vendor-reset.git

# cp vendor-reset.ko /lib/modules/$(uname -r)/kernel/drivers/gpu
# depmod
# echo "vendor-reset" >> /etc/modules
# echo "device_specific" > /sys/bus/pci/devices/0000\:2b\:00.0/reset_method
```

## ovmf
```
apt-get -d install ovmf
dpkg-deb -x /var/cache/apt/archive/ovmf.deb ovmf
```

## vendor and device ids
```
apt-get -d install pciutils
dpkg-deb -x /var/cache/apt/archive/pciutils.deb pciutils

./pciutils/usr/bin/lspci
```

## snd-hda-intel
```
echo "blacklist snd-hda-intel" > /etc/modprobe.d/alsa-base.conf
```
