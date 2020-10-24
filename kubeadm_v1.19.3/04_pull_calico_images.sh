#!/bin/bash


# Use Aliyun registry mirror to speed up pulling images from Docker Hub
# Add resigtry-middors in /etc/docker/daemon.json
# Run below commands:
# systemctl daemon-reload
# systemctl restart docker


docker pull calico/cni:v3.16.4
docker pull calico/pod2daemon-flexvol:v3.16.4
docker pull calico/node:v3.16.4
docker pull calico/kube-controllers:v3.16.4

docker images | grep calico
