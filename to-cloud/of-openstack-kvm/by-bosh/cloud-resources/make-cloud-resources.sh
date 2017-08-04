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
    echo "export OS_DOMAIN=default" | tee -a $resources/rc
    echo "export OS_PROJECT=jimlin" | tee -a $resources/rc
    echo "export OS_USERNAME=jimlin" | tee -a $resources/rc
    echo "export OS_PASSWORD=jimlin" | tee -a $resources/rc
    echo "export OS_RES_SECURITY_GROUP=bosh" | tee -a $resources/rc
    echo "export OS_RES_KEY_PAIR=bosh" | tee -a $resources/rc
    echo "export OS_RES_NETWORK_UUID=a57de587-1bea-4173-9fed-1585b9c388ae" | tee -a $resources/rc
    echo "export OS_RES_NETWORK_SUBNET_CIDR=192.168.103.0/24" | tee -a $resources/rc
    echo "export OS_RES_NETWORK_SUBNET_GW=192.168.103.1" | tee -a $resources/rc
    echo "export OS_RES_NETWORK_SUBNET_DHCP=192.168.103.2" | tee -a $resources/rc
    echo "export OS_RES_NETWORK_SUBNET_DIRECTOR=192.168.103.3" | tee -a $resources/rc
    echo "export OS_RES_FLOATING_IP_BOSH_DIRECTOR=192.168.240.34" | tee -a $resources/rc
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
