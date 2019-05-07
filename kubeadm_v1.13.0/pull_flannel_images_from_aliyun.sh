#!/bin/bash

set -e

# Check images in https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml

FLANNEL_VERSION=v0.11.0


COREOS_URL=quay.io/coreos
ALIYUN_URL=registry.cn-shenzhen.aliyuncs.com/cookcodeblog

images=(flannel:${FLANNEL_VERSION}-amd64
flannel:${FLANNEL_VERSION}-arm64
flannel:${FLANNEL_VERSION}-arm
flannel:${FLANNEL_VERSION}-ppc64le
flannel:${FLANNEL_VERSION}-s390x)


for imageName in ${images[@]} ; do
  docker pull $ALIYUN_URL/$imageName
  docker tag  $ALIYUN_URL/$imageName $COREOS_URL/$imageName
  docker rmi $ALIYUN_URL/$imageName
done

docker images



