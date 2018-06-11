#!/bin/bash

set -e

./use_aliyun_kubernetes_yum_source.sh

setenforce 0
yum install -y kubelet-1.10.3 kubeadm-1.10.3 kubectl-1.10.3
systemctl enable kubelet && systemctl start kubelet

# Configure cgroup matched with Docker
./configure_cgroup.sh
systemctl daemon-reload
systemctl restart kubelet


# Set pause-amd64 image for kubelet service
cat > /etc/systemd/system/kubelet.service.d/20-pod-infra-image.conf <<EOF
[Service]
Environment="KUBELET_EXTRA_ARGS=--pod-infra-container-image=registry.cn-shenzhen.aliyuncs.com/cookcodeblog/pause-amd64:3.1"
EOF

systemctl daemon-reload
systemctl restart kubelet

