#!/bin/bash

set -e

# Uninstall installed docker
sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine


# Set up repository
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Use Aliyun Docker
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# Install a validated docker version
sudo yum install -y docker-ce-19.03.11 docker-ce-cli-19.03.11 containerd.io-1.2.13

# Setup Docker daemon
mkdir -p /etc/docker
sudo cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

sudo mkdir -p /etc/systemd/system/docker.service.d

# Run Docker as systemd service
sudo systemctl daemon-reload
sudo systemctl enable docker
sudo systemctl start docker

# Check Docker version
docker version


