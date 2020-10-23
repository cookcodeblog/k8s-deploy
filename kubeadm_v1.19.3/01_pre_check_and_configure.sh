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

echo "###############################################"
echo "Please check default route:"
ip route show

# Stop firewalld
echo "###############################################"
echo "Stop firewalld"
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo systemctl status firewalld

# Disable SELinux
echo "###############################################"
echo "Disable SELinux"
sudo getenforce

sudo setenforce 0
sudo cp -p /etc/selinux/config /etc/selinux/config.bak$(date '+%Y%m%d%H%M%S')
sudo sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config

sudo getenforce

# Turn off Swap
echo "###############################################"
echo "Turn off Swap"
free -m
sudo cat /proc/swaps

sudo swapoff -a

sudo cp -p /etc/fstab /etc/fstab.bak$(date '+%Y%m%d%H%M%S')
sudo sed -i "s/\/dev\/mapper\/rhel-swap/\#\/dev\/mapper\/rhel-swap/g" /etc/fstab
sed -i "s/\/dev\/mapper\/centos-swap/\#\/dev\/mapper\/centos-swap/g" /etc/fstab
sudo mount -a

free -m
sudo cat /proc/swaps

# Setup iptables (routing)
echo "###############################################"
echo "Setup iptables (routing)"
sudo cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-arptables = 1
EOF

sudo sysctl --system


# Check ports
echo "###############################################"
echo "Check API server port(s)"
netstat -nlp | grep "8080\|6443"

echo "Check ETCD port(s)"
netstat -nlp | grep "2379\|2380"

echo "Check port(s): kublet, kube-scheduler, kube-controller-manager"
netstat -nlp | grep "10250\|10251\|10252"


