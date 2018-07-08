#!/bin/bash

set -e

grep 'client-certificate-data' ~/.kube/config | head -n 1 | awk '{print $2}' | base64 -d >> kubecfg.crt
grep 'client-key-data' ~/.kube/config | head -n 1 | awk '{print $2}' | base64 -d >> kubecfg.key
openssl pkcs12 -export -clcerts -inkey kubecfg.key -in kubecfg.crt -out kubecfg.p12 -name "kubernetes-client"

echo "Genereated kubecfg certificates under $(pwd): "
ls -ltra kubecfg*

echo "Please install the kubecfg.p12 certificate in your browser, and then restart browser."

