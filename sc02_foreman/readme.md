# 2. Scenario - With Foreman

## Customize image

```shell
rm -rf ./isos/sc02_stream9.iso

# As a root
mkksiso --cmdline "inst.ks=http://foreman.local.lan:8080/unattended/provision inst.ks.sendmac ip=dhcp" \
  ./isos/CentOS-Stream-9-latest-x86_64-boot.iso \
  ./isos/sc02_stream9.iso
```

- `inst.ks` Location of a kickstart file
- `inst.ks.sendmac` Add headers to outgoing HTTP requests which include the MAC addresses of all network interfaces.

See more at [Anaconda Boot Options](https://anaconda-installer.readthedocs.io/en/latest/boot-options.html)

## Boot the VM

```shell
virt-install  --name=sc02_stream9 \
              --vcpus=4 \
              --memory=4096 \
              --disk size=10 \
              --os-variant=centos-stream9 \
              --network "network=foreman_default,mac=00:aa:aa:09:09:02" \
              --connect qemu:///system \
              --boot cdrom,hd \
              --cdrom=./isos/sc02_stream9.iso
```
