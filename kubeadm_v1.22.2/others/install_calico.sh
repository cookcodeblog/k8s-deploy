#!/bin/bash

set -e

kubectl taint nodes --all node-role.kubernetes.io/master-

kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml

kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml

# wait to running
watch kubectl get pods -n calico-system

kubectl get nodes -o wide

