#!/bin/bash

<<PSEUDO
bosh --ca-cert root-ca.pem -e $BOSH_DIRECTOR_IP login

spiff merge cloud-config-template.yml openstack-stub.yml > cloud-config.yml

bosh-cli --ca-cert certs/rootCA.pem -e $BOSH_DIRECTOR_IP update-cloud-config cloud-config.yml

bosh-cli --ca-cert certs/rootCA.pem -e $BOSH_DIRECTOR_IP upload-stemcell STEMCELL-URL

bosh-cli --ca-cert certs/rootCA.pem -e $BOSH_DIRECTOR_IP env # to get director uuid

MODIFY director-stub.yml
PSEUDO

set -e

[ -f rc ] && source rc

if [ -z $BOSH_DIRECTOR_HOST ]; then
    if [ -z $OS_RES_FLOATING_IP_BOSH_DIRECTOR ]; then
        echo "Error. Missing environment variable BOSH_DIRECTOR_HOST."
        exit 1
    else
        BDIP=$OS_RES_FLOATING_IP_BOSH_DIRECTOR
    fi
else
    BDIP=$BOSH_DIRECTOR_HOST
fi

########################

configs=$(dirname $0)/configs
rm -rf $configs && mkdir -p $configs

spiff merge templates/cloud-config.yml openstack-stub.yml | tee configs/cloud-config.yml

bosh --ca-cert root-ca.pem -e $BDIP login
bosh --ca-cert root-ca.pem -e $BDIP update-cloud-config -n configs/cloud-config.yml

#bosh --ca-cert root-ca.pem -e $BDIP upload-stemcell $STEMCELL_URL

BDUUID=$(bosh --ca-cert root-ca.pem -e $BDIP env --json | jq -r '.Tables[0].Rows[1][1]')

sed "s/REPLACE_WITH_BOSH_DIRECTOR_UUID/$BDUUID/g" templates/director-stub.yml | tee configs/director-stub.yml
