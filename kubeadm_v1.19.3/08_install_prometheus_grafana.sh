#!/bin/bash

set -e


# https://github.com/prometheus-operator/kube-prometheus

# Install prometheus plugin
kubectl create -f ./prometheus_grafana/manifests/setup

# Verify prometheus plugin

kubectl get namespace monitoring

kubectl get crd | grep monitoring
kubectl get clusterrole.rbac.authorization.k8s.io | grep prometheus
kubectl get clusterrolebinding.rbac.authorization.k8s.io | grep prometheus

kubectl get deployment -n monitoring
kubectl get service -n monitoring
kubectl get serviceaccount -n monitoring
kubectl get pods -n monitoring


# Install Grafana and other plugins
kubectl apply -f ./prometheus_grafana/manifests/


# Verify Grafana and other plugins
kubectl get ds -n monitoring
kubectl get deployment -n monitoring
kubectl get svc -n monitoring
kubectl get ss -n monitoring
kubectl get pods -n monitoring

# Grafana service
echo "################################"
echo "Grafana service as below:"
kubectl get svc grafana -n monitoring

