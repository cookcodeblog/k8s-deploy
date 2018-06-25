#!/bin/bash

set -e



# Use kubernetes images from Aliyun
./use_aliyun_kubernetes_images.sh

# Create kubernetes dashboard
./create_k8s_dashboard.sh

# Create sample user
./create_sample_user.sh

# Generate user certificate
./generate_user_cert.sh

# Prompt to login
echo "Please login K8S dashboard:"
echo "https://your_master_ip:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/"
echo "Please paste above generated Service Account Token to login"
