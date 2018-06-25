#!/bin/bash

set -e


# Create Service Account
kubectl delete -f dashboard_service_account_admin.yaml --ignore-not-found=true
kubectl create -f dashboard_service_account_admin.yaml

# Create Cluster Role Binding
kubectl delete -f dashboard_cluster_role_binding_admin.yaml --ignore-not-found=true
kubectl create -f dashboard_cluster_role_binding_admin.yaml

# Get Service Account Token
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
