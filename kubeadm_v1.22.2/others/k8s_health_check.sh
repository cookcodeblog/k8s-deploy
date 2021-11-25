#!/bin/bash

set -e

# Kubernetes Cheatsheet
# https://v1-13.docs.kubernetes.io/docs/reference/kubectl/cheatsheet/
# kubectl --help

# Display cluster info
kubectl cluster-info

# Nodes
kubectl get nodes

# Display pds
kubectl get pods --all-namespaces -o wide

# Check pods status incase any pods are not in running status
kubectl get pods --all-namespaces | grep -v Running
