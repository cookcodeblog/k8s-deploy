# 一键部署Kubernetes Dashboard



在Kubernetes 1.7后，Kubernetes Dashboard的授权方式发生了很大变化，网络上查到的一些中文资料已经过时了。



根据自己的亲身实践，写了一键部署Kubernetes Dashboard脚本。



特点：

* 一键部署，避免踩坑
* 采用Kubernetes推荐的安装方法和访问方法
* 使用阿里云镜像仓库避免拉取不了gcr.io镜像问题
* 支持Kubernetes Dashboard v1.8.3 最新版



## 参考文档

- http://www.joseluisgomez.com/containers/kubernetes-dashboard/

- https://github.com/kubernetes/dashboard/wiki/

- https://github.com/kubernetes/dashboard/wiki/Accessing-Dashboard---1.7.X-and-above

- https://github.com/kubernetes/dashboard/wiki/Creating-sample-user

  

## 安装步骤



克隆或复制k8s_dashboard目录到K8S master上，运行以下命令：

```bash
chmod u+x *.sh
./deploy_k8s_dashboard.sh
```



安装脚本会生成一个Sample  Service Account (admin-user) 的Token，需要从控制台日志中复制该token。

安装脚本会生成User Certificate，需要将该证书保存到本地，并安装该证书到浏览器中，然后重启浏览器。



## 访问Dashboard



在成功安装上面的证书后，通过浏览器访问：

```
https://<master-ip>:<apiserver-port>/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
```



输入上面的token就可以访问Dashboard了。



## 多租户访问



上面的admin-user的权限很大，实际操作中，需要为不同的namespace创建不同的Service Account，并生成相应的用户证书和token。



参考文档：https://docs.bitnami.com/kubernetes/how-to/configure-rbac-in-your-kubernetes-cluster/#use-case-1-create-user-with-limited-namespace-access



## 集成Heapster



为了能在K8S Dashboard中监控集群性能指标，还需要集成Heapster。



TBC

