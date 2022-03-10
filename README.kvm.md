## Packages
### Server
- dbus
- locales
- linux-image-amd64
- libvirt-clients
- libvirt-daemon-system
- qemu-system-x86-64
- qemu-utils
- systemd-sysv
- netcat-openbsd
- iproute2
### Manager
- virt-manager

## NET network
```
virsh net-autostart default
virsh net-start default
```

## Boot options
```
options amd_iommu=on iommu=pt video=efifb:off
```

## CPU settings
```
Model: host-passthrough
Socket: 1
Cores: 4 or 8
Threads: 2
```
## GPU rom
- Download GPU rom from: https://www.techpowerup.com/vgabios
```
wget https://www.techpowerup.com/vgabios/212120/AMD.RX5700XT.8192.190616.rom

```
- Specify it inside VMs XML file:
```
<hostdev mode='subsystem' type='pci' managed='yes'>
  <source>
    <address domain='0x0000' bus='0x2b' slot='0x00' function='0x0'/>
  </source>
  ...
  <rom file='/kvm/bios/AMD.RX5700XT.8192.190616.rom'/>
  ...
</hostdev>

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
