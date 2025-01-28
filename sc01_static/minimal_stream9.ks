url --url http://mirror.stream.centos.org/9-stream/BaseOS/x86_64/os
network --noipv6 --mtu=1500 --bootproto dhcp

lang en_US.UTF-8
selinux --enforcing
keyboard us
rootpw --plaintext changeme
authselect --useshadow --passalgo=sha512 --kickstart
timezone --utc UTC
services --disabled gpm,sendmail,cups,pcmcia,isdn,rawdevices,hpoj,bluetooth,openibd,avahi-daemon,avahi-dnsconfd,hidd,hplip,pcscd
bootloader --location=mbr --append="nofb quiet splash=quiet"
zerombr
clearpart --all --initlabel
autopart
skipx
text
reboot

%packages
@^server-product-environment
%end

# Post-installation script
%post
%end
