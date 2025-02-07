# Foreman - Provisioning hosts with boot ISO

Tested & presented on Fedora 41.

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

## Other

### Debugging

```shell
mkksiso --cmdline inst.sshd inst.debug
```

- `inst.sshd` enables the SSH daemon (sshd) during the installation process.
- `inst.debug` increases the verbosity of the logging during the installation process. Logs are usually written to /tmp/anaconda.log and /tmp/program.log

## KS helpers

```shell
dnf install pykickstart

ksvalidator --version RHEL9 ./your.ks
ksvalidator --version F41 ./your.ks

ksverdiff --from RHEL8 --to RHEL9
ksverdiff --from F40 --to F41
```

### mkksiso --add

Where is my directory?

```shell
/run/install/repo/$YOUR_DIR
/run/install/repo/foreman_files
```

## Links

- https://anaconda-installer.readthedocs.io/en/latest/index.html
- https://weldr.io/lorax/mkksiso.html
