#!/bin/bash


set -e

# Pull registry:2 image and run it
if [[ `docker ps | grep registry | wc -l` > 0 ]]; then
  docker stop registry
  docker rm registry
fi
docker run -d -p 5000:5000 -v /var/lib/docker-registry:/var/lib/registry -e REGISTRY_STORAGE_DELETE_ENABLED="true" --restart=always --name registry registry:2

./use_aliyun_registry_mirror_and_private_registry.sh
