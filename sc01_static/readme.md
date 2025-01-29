# 1. Scenario - Static

Customize ISO

```shell
rm -rf ./isos/sc01_stream9.iso

# As a root
mkksiso --ks ./sc01_static/minimal_stream9.ks \
  ./isos/CentOS-Stream-9-latest-x86_64-boot.iso \
  ./isos/sc01_stream9.iso
```

Boot the VM

```shell
virt-install  --name=sc01_stream9 \
              --vcpus=4 \
              --memory=4096 \
              --disk size=10 \
              --os-variant=centos-stream9 \
              --network "network=foreman_default,mac=00:aa:aa:09:09:01" \
              --connect qemu:///system \
              --boot cdrom,hd \
              --cdrom=./isos/sc01_stream9.iso
```
