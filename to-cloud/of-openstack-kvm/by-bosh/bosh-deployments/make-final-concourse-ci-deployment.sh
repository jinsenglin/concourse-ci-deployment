#!/bin/bash

<<PSEUDO
spiff merge concourse-template.yml openstack-stub.yml director-stub.yml concourse-stub.yml > concourse-deployment.yml
PSEUDO

set -e

[ -f rc ] && source rc

if [ -z $CONCOURSE_CI_HOST ]; then
    if [ -z $OS_RES_FLOATING_IP_CONCOURSE_CI ]; then
        echo "Error. Missing environment variable CONCOURSE_CI_HOST."
        exit 1
    else
        CCIP=$OS_RES_FLOATING_IP_CONCOURSE_CI
    fi
else
    CCIP=$CONCOURSE_CI_HOST
fi

########################

sed "s/REPLACE_WITH_OS_RES_FLOATING_IP_CONCOURSE_CI/$CCIP/g" templates/concourse-stub.yml | tee deployments/concourse-stub.yml

spiff merge templates/concourse-ci.yml deployments/openstack-stub.yml director-stub.yml deployments/concourse-stub.yml | tee deployments/concourse-ci.yml
