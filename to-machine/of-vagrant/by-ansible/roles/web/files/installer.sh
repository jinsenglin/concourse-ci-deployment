#!/bin/bash

echo "Current user: $(whoami)"

apt-get update

#
touch $(dirname $0)/installed
