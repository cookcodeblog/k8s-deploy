#!/bin/bash

set -e

# Kubernetes Cheatsheet
# https://v1-13.docs.kubernetes.io/docs/reference/kubectl/cheatsheet/
# kubectl --help

# Display cluster info
kubectl cluster-info

# Display pds
kubectl get pods --all-namespaces -o wide

# Check component status
kubectl get cs

# Check pods status incase any pods are not in running status
kubectl get pods --all-namespaces | grep -v Running

# Nodes
kubectl get nodes
