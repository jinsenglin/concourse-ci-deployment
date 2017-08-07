#!/bin/bash

echo "Current user: $(whoami)"

apt-get update
#apt-get remove -y postgresql
apt-get install -y postgresql=9.5+173 postgresql-contrib=9.5+173

sudo -u postgres createuser concourse
sudo -u postgres createdb --owner=concourse atc

# change 127.0.0.1:5432 to 0.0.0.0:5432
systemctl stop postgresql
sed -i "$ a host    all             all             0.0.0.0/0                trust" /etc/postgresql/9.5/main/pg_hba.conf
sed -i "/listen_addresses/ a listen_addresses = '*'"                                /etc/postgresql/9.5/main/postgresql.conf
systemctl start postgresql

#
touch /tmp/installed
