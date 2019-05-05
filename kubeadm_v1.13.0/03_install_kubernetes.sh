#!/bin/bash

set -e

./use_aliyun_kubernetes_yum_source.sh

setenforce 0
yum install -y kubelet-1.13.0
yum install -y kubeadm-1.13.0
yum install -y kubectl-1.13.0

systemctl enable kubelet && systemctl start kubelet

# Configure cgroup matched with Docker
# TODO still need configure cgroup ?
./configure_cgroup.sh
systemctl daemon-reload
systemctl restart kubelet
