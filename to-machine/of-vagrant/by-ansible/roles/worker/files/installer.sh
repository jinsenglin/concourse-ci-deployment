#!/bin/bash

echo "Current user: $(whoami)"

apt-get update
wget -q https://github.com/concourse/concourse/releases/download/v3.3.4/concourse_linux_amd64 -O concourse && chmod +x concourse && mv concourse /usr/local/bin/concourse

#
touch $(dirname $0)/installed
