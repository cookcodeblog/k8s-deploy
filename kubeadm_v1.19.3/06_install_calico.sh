#!/bin/bash

set -e


# wget -O ./calico/calico.yaml https://docs.projectcalico.org/v3.16/manifests/calico.yaml
IFACE="$1"
MANIFEST_NAME="calico.yaml"
if [[ -n "${IFACE}" ]]; then
  MANIFEST_NAME="calico-${IFACE}.yaml"
fi

kubectl apply -f ./calico/${MANIFEST_NAME}

# Wait a while to let network takes effect
sleep 30

kubectl get pods -n=kube-system -l k8s-app=calico-node

