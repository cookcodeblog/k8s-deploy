#!/bin/bash

set -e

mv /etc/yum.repos.d/CentOS-Linux-BaseOS.repo /etc/yum.repos.d/CentOS-Linux-BaseOS.repo.backup
wget -O /etc/yum.repos.d/CentOS-Linux-BaseOS.repo http://mirrors.aliyun.com/repo/Centos-8.repo

sudo yum clean all
sudo yum makecache -y
sudo yum repolist all

