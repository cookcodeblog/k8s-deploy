#!/bin/bash

set -e

./use_aliyun_kubernetes_yum_source.sh

setenforce 0
yum install -y kubelet-1.11.0 kubeadm-1.11.0 kubectl-1.11.0
systemctl enable kubelet && systemctl start kubelet

# Configure cgroup matched with Docker
./configure_cgroup.sh
systemctl daemon-reload
systemctl restart kubelet


# Don't set pause-amd64 image for kubelet service
# Use Kubernetes default pause image


