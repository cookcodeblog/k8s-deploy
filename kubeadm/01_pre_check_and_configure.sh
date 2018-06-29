#!/bin/bash

set -e

echo "###############################################"
echo "Please ensure your OS is CentOS7 64 bits"
echo "Please ensure your machine has full network connection and internet access"
echo "Please ensure run this script with root user"

# Check hostname, Mac addr and product_uuid
echo "###############################################"
echo "Please check hostname as below:"
uname -a

echo "###############################################"
echo "Please check Mac addr and product_uuid as below:"
ip link
sudo cat /sys/class/dmi/id/product_uuid

# Stop firewalld
echo "###############################################"
echo "Stop firewalld"
systemctl stop firewalld
systemctl disable firewalld

# Disable SELinux
echo "###############################################"
echo "Disable SELinux"
setenforce 0
cp -p /etc/selinux/config /etc/selinux/config.bak$(date '+%Y%m%d%H%M%S')
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config

# Turn off Swap
echo "###############################################"
echo "Turn off Swap"
swapoff -a
cp -p /etc/fstab /etc/fstab.bak$(date '+%Y%m%d%H%M%S')
sed -i "s/\/dev\/mapper\/rhel-swap/\#\/dev\/mapper\/rhel-swap/g" /etc/fstab
sed -i "s/\/dev\/mapper\/centos-swap/\#\/dev\/mapper\/centos-swap/g" /etc/fstab
mount -a
free -m
cat /proc/swaps

# Setup iptables (routing)
echo "###############################################"
echo "Setup iptables (routing)"
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-arptables = 1
EOF

sysctl --system

# Use Aliyun Yum source
echo "###############################################"
echo "Use Aliyun Yum source"
./use_aliyun_yum_source.sh

