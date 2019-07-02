#!/bin/bash

set -e

## Pre-configure
./01_pre_check_and_configure.sh

# Install Docker
./02_install_docker.sh

# Install kubelet kubeadm kubectl
./03_install_kubernetes.sh

# Pull kubernetes node images
./04_pull_kubernetes_node_images_from_aliyun.sh

# Pull flannel images
./pull_flannel_images_from_aliyun.sh



# Join kubernetes node

# Put "kubeadm join" here from "kubeadm init" output
# Example: kubeadm join 192.168.37.101:6443 --token mmxy0q.sjqca7zrzzj7czft --discovery-token-ca-cert-hash sha256:099421bf9b3c58e4e041e816ba6477477474614a17eca7f5d240eb733e7476bb	

# Run `kubeadm token create --print-join-command` in Kubernetes master to get `kubeadm join` command


# To resolve need specify API server and x509 error
# https://github.com/kubernetes/kubernetes/issues/48378
mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/kubelet.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
cp -p $HOME/.bash_profile $HOME/.bash_profile.bak$(date '+%Y%m%d%H%M%S')
echo "export KUBECONFIG=$HOME/.kube/config" >> $HOME/.bash_profile
source $HOME/.bash_profile


./k8s_health_check.sh

