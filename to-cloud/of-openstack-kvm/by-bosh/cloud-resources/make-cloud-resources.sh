#!/bin/bash

set -e

if [ $# -lt 1 ]; then
    echo
    echo "Error. Missing argument."
    echo
    echo "Usage: $0 [ collect | reserve-collect ]"
    echo
    exit 1
fi

function collect_op() {
    local resources=$(dirname $0)/resources
    rm -rf $resources && mkdir -p $resources

    echo "export OS_AUTH_URL=http://192.168.228.31:5000/v3" | tee -a $resources/rc
    echo "expxort OS_DOMAIN=default" | tee -a $resources/rc
    echo "expxort OS_PROJECT=devops" | tee -a $resources/rc
    echo "expxort OS_USERNAME=devops" | tee -a $resources/rc
    echo "expxort OS_PASSWORD=devops" | tee -a $resources/rc
    echo "expxort OS_RES_SECURITY_GROUP_=bosh" | tee -a $resources/rc
    echo "expxort OS_RES_KEY_PAIR=bosh" | tee -a $resources/rc
    echo "expxort OS_RES_NETWORK_=0cb3a322-67d9-47ef-bd54-7420c106fd2b" | tee -a $resources/rc
    echo "expxort OS_RES_NETWORK_SUBNET_CIDR=192.168.200.0/24" | tee -a $resources/rc
    echo "expxort OS_RES_NETWORK_SUBNET_GW=192.168.200.1" | tee -a $resources/rc
    echo "expxort OS_RES_NETWORK_SUBNET_DHCP=192.168.200.2" | tee -a $resources/rc
    echo "expxort OS_RES_NETWORK_SUBNET_DIRECTOR=192.168.200.3" | tee -a $resources/rc
    echo "expxort OS_REC_FLOATING_IP_BOSH_DIRECTOR=192.168.210.25" | tee -a $resources/rc
}

function reserve_op() {
    :
}

function reserve_collect_op() {
    reserve_op
    collect_op
}

# main
case $1 in
  collect)
    collect_op
    ;;
  reserve-collect)
    reserve_collect_op
    ;;
  *)
    echo
    echo "Error. Invalid argument."
    echo
    echo "Usage: $0 [ collect | reserve-collect ]"
    echo
    exit 1
    ;;
esac
