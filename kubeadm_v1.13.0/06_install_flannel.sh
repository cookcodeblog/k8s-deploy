#!/bin/bash

set -e

# For kubernetes v1.13.0 still use flannel 0.10.0
# Pull flannel images from Aliyun
docker pull registry.cn-shenzhen.aliyuncs.com/cookcodeblog/flannel:v0.10.0-amd64
docker tag registry.cn-shenzhen.aliyuncs.com/cookcodeblog/flannel:v0.10.0-amd64 quay.io/coreos/flannel:v0.10.0-amd64
docker rmi registry.cn-shenzhen.aliyuncs.com/cookcodeblog/flannel:v0.10.0-amd64

wget https://raw.githubusercontent.com/coreos/flannel/v0.10.0/Documentation/kube-flannel.yml

kubectl apply -f kube-flannel.yml

# Wait a while to let network takes effect
sleep 30
kubectl get pods --all-namespaces

# Check component status
kubectl get cs

# Check pods status incase any pods are not in running status
kubectl get pods --all-namespaces | grep -v Running

