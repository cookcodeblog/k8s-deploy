# k8s-deploy

one key deploy kubernetes script in china.

# How To Use

## Step 1

```
git clone https://github.com/b23r0/k8s-deploy.git
cd kubeadm_v1.22.2
chmod +x * ./aliyun/*
```

## Step 2

Run ``` kubeadm_init_master.sh ``` in kubernets Master node.

You can get join way:

```
kubeadm join xxx.xxx.xxx.xxx:6443 --token xxx.xxx --discovery-token-ca-cert-hash sha256:xxxxxxxxxxxxxxxxxxxxxxx
```

## Step 3

Run ``` kubeadm_join_node.sh ``` in kubernets Slave node.

## Step 4

Execute the shell obtained in the Step 1.

# TIPS

### Use Internet-IP manage K8s

You need edit kubeadm start argument ```--apiserver-cert-extra-sans=255.255.255.255``` in  ```05_kubeadm_init.sh```

### Install Calico and Metrics

I have carefully prepared two scripts in the ```others``` folder, and you need to execute them manually.