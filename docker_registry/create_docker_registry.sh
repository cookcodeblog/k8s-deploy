#!/bin/bash


set -e

# Pull registry:2 image and run it
docker stop registry
docker rm registry
docker run -d -p 5000:5000 -v /var/lib/docker-registry:/var/lib/registry --restart=always --name registry registry:2

./use_aliyun_registry_mirror_and_private_registry.sh
