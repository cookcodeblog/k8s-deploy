#!/bin/bash

set -e


# Deploy k8s master
kubectl delete -f kubernetes-dashboard.yaml --ignore-not-found=true
kubectl create -f kubernetes-dashboard.yaml

# Check pod status
kubectl get pods --namespace=kube-system  | grep kubernetes-dashboard

# Check pod details
kubectl describe pods kubernetes-dashboard --namespace=kube-system



