#!/bin/bash
./use_aliyun_kubernetes_yum_source.sh

setenforce 0
yum install -y kubelet-1.10.3 kubeadm-1.10.3 kubectl-1.10.3
systemctl enable kubelet && systemctl start kubelet

# Configure cgroup matched with Docker
./configure_cgroup.sh
systemctl daemon-reload
systemctl restart kubelet
