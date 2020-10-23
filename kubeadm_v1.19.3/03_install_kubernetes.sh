#!/bin/bash

set -e

./aliyun/use_aliyun_kubernetes_yum_source.sh

setenforce 0

sudo yum install -y kubelet-1.19.0 kubeadm-1.19.0 kubectl-1.19.0 --disableexcludes=kubernetes

# Check installed Kubernetes packages
sudo yum list installed | grep kube

sudo systemctl daemon-reload
sudo systemctl enable kubelet
sudo systemctl start kubelet
