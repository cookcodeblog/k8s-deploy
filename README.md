[TOC]



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
* CentOS7 64 bits



限制：

* 需要联网才能安装
* 以root用户运行
* 只支持创建单master+单etcd，还不支持master和etcd高可用



## k8s-deploy



打开 [k8s-deploy](https://github.com/cookcodeblog/k8s-deploy) 查看源代码，或者直接运行下面命令clone。



```bash
git clone https://github.com/cookcodeblog/k8s-deploy.git
```



MIT license。



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
./03_install_kubenetes.sh

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

运行`./kubeadm_join_node.sh` 将部署kubernetes node，并将该节点加入kubernetes集群。



## 参考文档

### kubeadm安装文档

- https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
- [使用 kubeadm 创建 kubernetes 1.9 集群](https://www.kubernetes.org.cn/3357.html)
- [使用kubeadm在CentOS 7上安装Kubernetes 1.8](https://www.zybuluo.com/ncepuwanghui/note/953929)
- [使用kubeadm安装Kubernetes 1.8版本](https://www.kubernetes.org.cn/2906.html)
- [使用kubeadm安装kubernetes1.7/1.8/1.9](https://blog.csdn.net/zhuchuangang/article/details/76572157/)
- [使用kubeadm创建一个K8s的Cluster](https://zhuanlan.zhihu.com/p/31398416)



### 使用国内的Yum源、Docker镜像和Kubernetes镜像

* [Kubernetes国内镜像、下载安装包和拉取gcr.io镜像](https://blog.csdn.net/nklinsirui/article/details/80581286)
* [Docker国内Yum源和国内镜像仓库](Docker国内Yum源和国内镜像仓库)
* [使用国内Yum源](使用国内Yum源)
* [在VMWare中设置ISO光盘镜像为本地Yum源](https://blog.csdn.net/nklinsirui/article/details/80145975)



### VMware 使用文档

* [ VMware workstation和VMware fusion安装CentOS7后联网问题](https://blog.csdn.net/nklinsirui/article/details/80378920)

  

### CentOS7使用文档

* [CentOS7 修改Hostname](https://blog.csdn.net/nklinsirui/article/details/80579342)

  