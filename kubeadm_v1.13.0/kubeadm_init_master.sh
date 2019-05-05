#!/bin/bash

set -e

# Pre-configure
./01_pre_check_and_configure.sh

# Install Docker
./02_install_docker.sh

# Install kubelet kubeadm kubectl
./03_install_kubernetes.sh

# Pull kubernetes images
./04_pull_kubernetes_images_from_aliyun.sh

# Initialize k8s master
./05_kubeadm_init.sh

# Install flannel Pod network
./06_install_flannel.sh
