#!/bin/bash

<<PSEUDO
bosh-cli --ca-cert certs/rootCA.pem -e $BOSH_DIRECTOR_IP login

spiff merge cloud-config-template.yml openstack-stub.yml > cloud-config.yml

bosh-cli --ca-cert certs/rootCA.pem -e $BOSH_DIRECTOR_IP update-cloud-config cloud-config.yml

bosh-cli --ca-cert certs/rootCA.pem -e $BOSH_DIRECTOR_IP upload-stemcell STEMCELL-URL

bosh-cli --ca-cert certs/rootCA.pem -e $BOSH_DIRECTOR_IP env # to get director uuid

MODIFY director-stub.yml
PSEUDO
