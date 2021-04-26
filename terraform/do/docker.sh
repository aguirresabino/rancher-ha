#!/bin/bash
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done
curl https://releases.rancher.com/install-docker/19.03.sh | sh
usermod -aG docker root