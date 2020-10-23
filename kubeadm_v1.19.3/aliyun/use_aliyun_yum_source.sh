#!/bin/bash

set -e

#wget -O /etc/yum.repos.d/CentOS7-Aliyun.repo http://mirrors.aliyun.com/repo/Centos-7.repo
sudo cp -p ./repo/CentOS7-Aliyun.repo /etc/yum.repos.d
sudo cp -p ./repo/epel-7-Aliyun.repo /etc/yum.repos.d

sudo yum clean all
sudo yum makecache -y
sudo yum repolist all

