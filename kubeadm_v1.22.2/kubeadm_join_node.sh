#!/bin/bash

set -e

## Pre-configure
./01_pre_check_and_configure.sh

# Install Docker
./02_install_docker.sh

# Install kubelet kubeadm kubectl
./03_install_kubernetes.sh

# Pull kubernetes node images
./04_pull_kubernetes_node_images_from_aliyun.sh




