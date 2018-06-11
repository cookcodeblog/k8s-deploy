#!/bin/bash

set -e

# Reset firstly if ran kubeadm init before
kubeadm reset

# kubeadm init with flannel network
export KUBE_REPO_PREFIX="registry.cn-shenzhen.aliyuncs.com/cookcodeblog"
export KUBE_ETCD_IMAGE="registry.cn-shenzhen.aliyuncs.com/cookcodeblog/etcd-amd64:3.1.12"
kubeadm init --kubernetes-version=v1.10.3 --pod-network-cidr=10.244.0.0/16


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
cp -p $HOME/.bash_profile $HOME/.bash_profile.bak$(date '+%Y%m%d%H%M%S')
echo "export KUBECONFIG=$HOME/.kube/config" >> $HOME/.bash_profile
source $HOME/.bash_profile


