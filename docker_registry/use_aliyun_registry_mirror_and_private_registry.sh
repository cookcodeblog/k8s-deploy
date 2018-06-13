#!/bin/bash


set -e

# Use Aliyun docker registry mirror and set insecure-registries
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://5twf62k1.mirror.aliyuncs.com"],
  "insecure-registries": ["192.168.37.100:5000"]
}
EOF

# Restart docker
systemctl daemon-reload
systemctl restart docker



