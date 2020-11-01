#!/bin/bash

set -e



kubectl apply -f ./metrics-server/metrics-server-insecure.yaml

sleep 10

# Check deployment
kubectl get deployment metrics-server -n kube-system

# Check pod status and ready
kubectl get pods -n kube-system -l k8s-app=metrics-server

# Check apiservice status
kubectl get apiservice v1beta1.metrics.k8s.io -o yaml



# Wait a while to let metrics server takes effect
sleep 180

kubectl top nodes
kubectl top pods -A


