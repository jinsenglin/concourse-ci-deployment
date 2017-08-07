#!/bin/bash

echo "Current user: $(whoami)"

apt-get update
wget -q https://github.com/concourse/concourse/releases/download/v3.3.4/concourse_linux_amd64 -O concourse && chmod +x concourse && mv concourse /usr/local/bin/concourse

mkdir /etc/concourse
cp $(dirname $0)/concourse-worker.service /etc/concourse/concourse-worker.service
cp $(dirname $0)/tsa_host_key.pub /etc/concourse/tsa_host_key.pub
cp $(dirname $0)/worker_key.pem /etc/concourse/worker_key.pem
cp $(dirname $0)/worker_environment /etc/concourse/worker_environment

adduser --system --group concourse
chown -R concourse:concourse /etc/concourse

ln -sf /etc/concourse/concourse-worker.service /etc/systemd/system/concourse-worker.service

systemctl start concourse-worker

#
touch $(dirname $0)/installed
