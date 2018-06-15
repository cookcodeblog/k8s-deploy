#!/bin/bash


set -e

# Pull registry:2 image and run it
if [[ `docker ps | grep registry | wc -l` > 0 ]]; then
  docker-compose down
fi
docker-compose up -d

./use_aliyun_registry_mirror_and_private_registry.sh




