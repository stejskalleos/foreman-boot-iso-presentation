# With Net Boot Default Kickstart template

## Customize image

```shell
rm -rf ./isos/sc03_stream9.iso

# As a root
mkksiso --ks ./sc03_netboot_ks/net_boot_default.ks \
  --cmdline "ip=dhcp" \
  --add ./foreman_files \
  ./isos/CentOS-Stream-9-latest-x86_64-boot.iso \
  ./isos/sc03_stream9.iso
```

## Boot the VM

```shell
virt-install  --name=sc03_stream9 \
              --vcpus=4 \
              --memory=4096 \
              --disk size=10 \
              --os-variant=centos-stream9 \
              --network "network=foreman_default,mac=00:aa:aa:09:09:03" \
              --connect qemu:///system \
              --boot cdrom,hd \
              --cdrom=./isos/sc03_stream9.iso
```
