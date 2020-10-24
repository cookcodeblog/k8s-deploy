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
./enable_kubectl_master.sh


# Get cluster information
kubectl cluster-info
