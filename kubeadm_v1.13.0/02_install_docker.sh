#!/bin/bash

set -e

# Uninstall installed docker
sudo yum remove docker \
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
# https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.13.md#external-dependencies
yum install docker-ce-18.06.0.ce -y

systemctl enable docker
systemctl start docker

docker version


# Use Aliyun docker registry
./use_aliyun_docker_registry.sh

