#!/bin/bash

set -e

wget -O calico.yaml https://docs.projectcalico.org/v3.16/manifests/calico.yaml
kubectl apply -f calico.yaml

# Wait a while to let network takes effect
sleep 30
./k8s_health_check.sh
