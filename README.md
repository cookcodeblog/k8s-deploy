

# 使用kubeadm一键部署kubernetes集群



k8s-deploy使用kubeadm一键部署kubernetes集群，让你完美避过各种坑。



特点：

* 一键部署，避免踩坑
* 不需要翻墙，不需要设置代理
* 使用国内的Yum源、Docker镜像和Kubernetes镜像，安装速度快
* 不设前提，能上外网的CentOS7就行



版本支持：

* kubernetes v1.10.3
* docker-ce 17.03.2
* Flannel network
* CentOS7 64 bits



限制：

* 需要联网才能安装
* 以root用户运行
* 只支持创建单master+单etcd，还不支持master和etcd高可用



## 部署kubernetes master

克隆（或复制）kubeadm目录到master机器上，以root用户运行`chmod u+x *.sh` 。



一键部署kubernetes master:

```bash
./kubeadm_init_master.sh
```



或者按以下步骤逐步运行：

```
# Pre-configure
./01_pre_check_and_configure.sh

# Install Docker
./02_install_docker.sh

# Install kubelet kubeadm kubectl
./03_install_kubernetes.sh

# Pull kubernetes images
./04_pull_kubernetes_images_from_aliyun.sh

# Initialize k8s master
./05_kubeadm_init.sh

# Install flannel Pod network
./06_install_flannel.sh
```



运行完后，需要复制第5步`kubeadm init` 的输出的 `kube join` 的内容，在下面的“部署kubernetes node”时会用到。



## 部署kubernetes node



克隆（或复制）kubeadm目录到node机器上，以root用户运行`chmod u+x *.sh` 。



将上面`kubeadm init` 的输出中的`kube join` 的内容放到kubeadm_join_node.sh的最后。

运行`./kubeadm_join_node.sh` 部署kubernetes node，并将该节点加入kubernetes集群。



## 详细文档



详细文档请参考我的博客文章：

* [使用kubeadm一键部署kubernetes集群](https://mp.csdn.net/mdeditor/80602724)