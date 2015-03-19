#!/bin/bash
    # Define version Fedora
    version=$(rpm -q --queryformat '%{VERSION}\n' fedora-release)
    
if [ $(rpm -qa rpmfusion-free-release | grep -c rpmfusion-free-release) -gt 0 ] && [ $(rpm -qa rpmfusion-nonfree-release | grep -c rpmfusion-nonfree-release) -gt 0 ]; then
echo 'installed rpmfusion free and nonfree repository'
else
dnf -y install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$version.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$version.noarch.rpm     
fi

if [ $(rpm -qa kernel-devel | grep -c kernel-devel) -gt 0 ]; then
echo 'installed kernel-devel'
else
dnf -y install kernel-devel
fi
dnf clean metadata && dnf -y install wget 
yum -y install broadcom-wl akmod-wl && echo modeprobe wl >> /etc/rc.local && dnf -y update
