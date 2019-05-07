#!/bin/bash

set -e

./pull_flannel_images_from_aliyun.sh

# https://v1-13.docs.kubernetes.io/docs/setup/independent/create-cluster-kubeadm/#pod-network
wget https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml

kubectl apply -f kube-flannel.yml

# Wait a while to let network takes effect
sleep 30
kubectl get pods --all-namespaces

# Check component status
kubectl get cs

# Check pods status incase any pods are not in running status
kubectl get pods --all-namespaces | grep -v Running

