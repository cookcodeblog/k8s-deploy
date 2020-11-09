#!/bin/bash

cd /etc/systemd/system/docker.service.d

cp http-proxy.conf.bak http-proxy.conf

systemctl daemon-reload
systemctl restart docker