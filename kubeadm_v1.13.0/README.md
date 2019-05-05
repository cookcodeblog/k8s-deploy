# Install Kubernetes v1.13.0

* Use Aliyun Yum repo
* Use Aliyun Docker repo
* Use Aliyun Kubernetes repo
* Docker 18.06
* kubeadm 1.13
* kubelet 1.13
* kubectl 1.13

## Kubernetes Images

Since Kubernetes 1.11

```bash
kubeadm config images list
kubeadm config images pull
```

* k8s.gcr.io/kube-apiserver:v1.13.0
* k8s.gcr.io/kube-controller-manager:v1.13.0
* k8s.gcr.io/kube-scheduler:v1.13.0
* k8s.gcr.io/kube-proxy:v1.13.0
* k8s.gcr.io/pause:3.1
* k8s.gcr.io/etcd:3.2.24
* k8s.gcr.io/coredns:1.2.6
