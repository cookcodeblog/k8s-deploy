#!/bin/bash


set -e

# Pull registry:2 image and run it
docker-compose down
docker-compose up -d

./use_aliyun_registry_mirror_and_private_registry.sh




