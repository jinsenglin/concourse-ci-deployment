#!/bin/bash

set -e

[ -d deployments ] || mkdir deployments

if [ -f rc ]; then
    sed -E 's/(.*)/      \1/g' ca-cert | tee deployments/ca-cert
    sed -E 's/(.*)/      \1/g' director-cert | tee deployments/director-cert 
    sed -E 's/(.*)/      \1/g' director-key | tee deployments/director-key

    source rc

    sed "s|REPLACE_WITH_OS_AUTH_URL|$OS_AUTH_URL|g" templates/openstack-stub.yml | \
    sed "s|REPLACE_WITH_OS_PROJECT|$OS_PROJECT|g" | \
    sed "s|REPLACE_WITH_OS_DOMAIN|$OS_DOMAIN|g" | \
    sed "s|REPLACE_WITH_OS_USERNAME|$OS_USERNAME|g" | \
    sed "s|REPLACE_WITH_OS_PASSWORD|$OS_PASSWORD|g" | \
    sed "s|REPLACE_WITH_OS_RES_SECURITY_GROUP|$OS_RES_SECURITY_GROUP|g" | \
    sed "s|REPLACE_WITH_OS_RES_KEY_PAIR|$OS_RES_KEY_PAIR|g" | \
    sed "s|REPLACE_WITH_OS_RES_NETWORK_SUBNET_CIDR|$OS_RES_NETWORK_SUBNET_CIDR|g" | \
    sed "s|REPLACE_WITH_OS_RES_NETWORK_SUBNET_GW|$OS_RES_NETWORK_SUBNET_GW|g" | \
    sed "s|REPLACE_WITH_OS_RES_NETWORK_UUID|$OS_RES_NETWORK_UUID|g" | \
    sed "s|REPLACE_WITH_OS_RES_NETWORK_SUBNET_DHCP|$OS_RES_NETWORK_SUBNET_DHCP|g" | \
    sed "s|REPLACE_WITH_OS_RES_NETWORK_SUBNET_DIRECTOR|$OS_RES_NETWORK_SUBNET_DIRECTOR|g" | \
    sed "s|REPLACE_WITH_OS_RES_FLOATING_IP_BOSH_DIRECTOR|$OS_RES_FLOATING_IP_BOSH_DIRECTOR|g" | \
    tee deployments/openstack-stub.yml

    sed -i '/ca-cert/ r deployments/ca-cert' deployments/openstack-stub.yml
    sed -i '/director-cert/ r deployments/director-cert' deployments/openstack-stub.yml
    sed -i '/director-key/ r deployments/director-key' deployments/openstack-stub.yml
else
    echo Skipping making deployments/openstack-stub.yml
fi

spiff merge templates/bosh-director.yml deployments/openstack-stub.yml | tee deployments/bosh-director.yml
