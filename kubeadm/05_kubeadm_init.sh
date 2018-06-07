
# Reset firstly if ran kubeadm init before
kubeadm reset

# Set pause-amd64 image for kubelet service
cat > /etc/systemd/system/kubelet.service.d/20-pod-infra-image.conf <<EOF
[Service]
Environment="KUBELET_EXTRA_ARGS=--pod-infra-container-image=registry.cn-shenzhen.aliyuncs.com/cookcodeblog/pause-amd64:3.0"
EOF

systemctl daemon-reload
systemctl restart kubelet

# kubeadm init with flannel network
export KUBE_REPO_PREFIX="registry.cn-shenzhen.aliyuncs.com/cookcodeblog"
export KUBE_ETCD_IMAGE="registry.cn-shenzhen.aliyuncs.com/cookcodeblog/etcd-amd64:3.1.12"
kubeadm init --kubernetes-version=v1.10.3 --pod-network-cidr=10.244.0.0/16


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


