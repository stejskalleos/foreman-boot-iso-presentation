# Foreman - Provisioning hosts with boot ISO

Tested & demoed on Fedora 41.

## Installation

```shell
dnf install -y lorax grub2-tools dracut edk2-ovmf
dnf update -y

# Reboot if kernel have been updated
reboot now
```

## Download Boot ISOs

CentOS Stream 9

```shell
wget https://ftp.fi.muni.cz/pub/linux/centos-stream/9-stream/BaseOS/x86_64/iso/CentOS-Stream-9-latest-x86_64-boot.iso -O ./isos/CentOS-Stream-9-latest-x86_64-boot.iso
```

CentOS Stream 10

```shell
wget https://ftp.fi.muni.cz/pub/linux/centos-stream/10-stream/BaseOS/x86_64/iso/CentOS-Stream-10-latest-x86_64-boot.iso -O ./isos/CentOS-Stream-10-latest-x86_64-boot.iso
```
