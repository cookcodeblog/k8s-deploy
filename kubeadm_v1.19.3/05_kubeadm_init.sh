#!/bin/bash

set -e

# Reset firstly if ran kubeadm init before
kubeadm reset -f

# kubeadm init with calico network
CONTROL_PLANE_ENDPOINT="$1"
API_SERVER_IP="$2"
IMAGE_REPOSITORY=registry.cn-shenzhen.aliyuncs.com/cookcodeblog

kubeadm init \
  --kubernetes-version=v1.19.3 \
  --control-plane-endpoint=${CONTROL_PLANE_ENDPOINT} \
  --apiserver-advertise-address=${API_SERVER_IP} \
  --pod-network-cidr=192.168.0.0/16 \
  --image-repository=${IMAGE_REPOSITORY} \
  --upload-certs


# Make kubectl works

mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

cp -p $HOME/.bash_profile $HOME/.bash_profile.bak$(date '+%Y%m%d%H%M%S')
echo "export KUBECONFIG=$HOME/.kube/config" >> $HOME/.bash_profile
source $HOME/.bash_profile

# Get cluster information
kubectl cluster-info
