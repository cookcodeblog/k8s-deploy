[TOC]

# 一键搭建Docker private registry



## 前言

`docker_registry` 目录提供了2种方法来一键搭建Docker private registry。



特点：

* 一键安装，方便快捷
* 自动添加`insecure-registries` Docker运行参数
* 使用阿里云镜像加速器，以后拉取官方镜像快
* 支持重复运行脚本搭建



限制：

* 目前只支持HTTP方式，还不支持HTTPS方式。
* 选择以下两种方式之一，不要混合使用，否则需要手工停止并删除`registry 镜像`。



> 先在`docker_registry` 目录下运行`chmod -R u+x *.sh` 设置脚本运行权限，再运行下面的脚本搭建。



## Docker run方式



在`run` 目录运行`./create_docker_registry.sh` 。



##Docker Compose方式 



在`docker-compose` 目录运行`./create_docker_registry_compose.sh` 。





