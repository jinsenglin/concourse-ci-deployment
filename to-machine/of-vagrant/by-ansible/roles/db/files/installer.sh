#!/bin/bash

echo "Current user: $(whoami)"

apt-get update
apt-get install -y postgresql postgresql-contrib

sudo -u postgres createuser concourse
sudo -u postgres createdb --owner=concourse atc
