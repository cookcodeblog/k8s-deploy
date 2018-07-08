#!/bin/bash

set -e

# Use Aliyun Heapster images
./use_aliyun_heapster_images.sh

# Create K8S resources
kubectl apply -f grafana.yaml
kubectl apply -f heapster.yaml
kubectl apply -f influxdb.yaml


kubectl apply -f heapster-rbac.yaml

# Check Pod status

kubectl get pods -n kube-system

# Check cluster info

kubectl cluster-info



