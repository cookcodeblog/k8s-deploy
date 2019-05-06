#!/bin/bash

set -e

./use_aliyun_kubernetes_yum_source.sh

setenforce 0
# Use Kubernetes-cni-0.6.0 explictly
# https://github.com/kubernetes/kubernetes/issues/75701
yum install -y kubelet-1.11.0 kubeadm-1.11.0 kubectl-1.11.0 kubernetes-cni-0.6.0

# Check installed Kubernetes packages
yum list installed | grep kube

systemctl enable kubelet && systemctl start kubelet

# Configure cgroup matched with Docker
./configure_cgroup.sh
systemctl daemon-reload
systemctl restart kubelet


# Don't set pause-amd64 image for kubelet service
# Use Kubernetes default pause image


