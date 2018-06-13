#!/bin/bash

docker pull busybox
docker images | grep busybox
docker tag busybox 192.168.37.100:5000/busybox
docker images | grep busybox
docker push 192.168.37.100:5000/busybox
docker rmi busybox
docker rmi 192.168.37.100:5000/busybox
docker images | grep busybox
docker pull 192.168.37.100:5000/busybox
docker images | grep busybox
docker rmi 192.168.37.100:5000/busybox
docker images | grep busybox
