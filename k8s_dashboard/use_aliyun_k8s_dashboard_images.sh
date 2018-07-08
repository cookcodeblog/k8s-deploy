#!/bin/bash

set -e

wget -O kubernetes-dashboard.yaml https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
cp -p kubernetes-dashboard.yaml kubernetes-dashboard.yaml.bak$(date '+%Y%m%d%H%M%S')

# Replace k8s.gcr.io image with registry.cn-shenzhen.aliyuncs.com/cookcodeblog
sed -i "s/k8s\.gcr\.io/registry\.cn-shenzhen\.aliyuncs\.com\/cookcodeblog/g" kubernetes-dashboard.yaml


