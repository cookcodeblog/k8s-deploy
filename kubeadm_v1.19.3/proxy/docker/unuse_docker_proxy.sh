#!/bin/bash

cd /etc/systemd/system/docker.service.d

rm http-proxy.conf

systemctl daemon-reload
systemctl restart docker