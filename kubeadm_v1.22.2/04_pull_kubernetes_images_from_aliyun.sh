#!/bin/bash

set -e

# Run `kubeadm config images list` to check required images
# Check version in https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/
# Search "Running kubeadm without an internet connection"
# For running kubeadm without an internet connection you have to pre-pull the required master images for the version of choice:
KUBE_VERSION=v1.22.2
KUBE_PAUSE_VERSION=3.5
ETCD_VERSION=3.5.0-0
CORE_DNS_VERSION=1.8.4

# GCR_URL=k8s.gcr.io
ALIYUN_URL=registry.aliyuncs.com/google_containers

# In Kubernetes 1.12 and later, the k8s.gcr.io/kube-*, k8s.gcr.io/etcd and k8s.gcr.io/pause images don’t require an -${ARCH} suffix
images=(kube-proxy:${KUBE_VERSION}
kube-scheduler:${KUBE_VERSION}
kube-controller-manager:${KUBE_VERSION}
kube-apiserver:${KUBE_VERSION}
pause:${KUBE_PAUSE_VERSION}
etcd:${ETCD_VERSION}
coredns:${CORE_DNS_VERSION})


for imageName in ${images[@]} ; do
  docker pull $ALIYUN_URL/$imageName
  # docker tag  $ALIYUN_URL/$imageName $GCR_URL/$imageName
  # docker rmi $ALIYUN_URL/$imageName
done

docker images
