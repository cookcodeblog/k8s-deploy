#!/bin/bash

set -e

#wget -O /etc/yum.repos.d/CentOS7-Aliyun.repo http://mirrors.aliyun.com/repo/Centos-7.repo
cp -p ./CentOS7-Aliyun.repo /etc/yum.repos.d
yum clean all
yum makecache -y
yum repolist all

yum install wget -y
