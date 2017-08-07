#!/bin/bash

echo "Current user: $(whoami)"

apt-get update
wget -q https://github.com/concourse/concourse/releases/download/v3.3.4/concourse_linux_amd64 -O concourse && chmod +x concourse && mv concourse /usr/local/bin/concourse

mkdir /etc/concourse
cp $(dirname $0)/concourse-web.service /etc/concourse/concourse-web.service
cp $(dirname $0)/tsa_host_key.pem /etc/concourse/tsa_host_key.pem
cp $(dirname $0)/session_signing_key.pem /etc/concourse/session_signing_key.pem
cp $(dirname $0)/authorized_worker_keys /etc/concourse/authorized_worker_keys
cp $(dirname $0)/web_environment /etc/concourse/web_environment

adduser --system --group concourse
chown -R concourse:concourse /etc/concourse

ln -sf /etc/concourse/concourse-web.service /etc/systemd/system/concourse-web.service

systemctl start concourse-web

#
touch $(dirname $0)/installed
