#!/bin/bash

set -e

if [ $# -lt 1 ]; then
    echo
    echo "Error. Missing argument."
    echo
    echo "Usage: $0 <backup src dir>"
    echo
    exit 1
fi
SRC=$1/phase2

if [ ! -d $SRC ]; then
    echo
    echo "Error. Invalid argument."
    echo
    echo "Directory $SRC no found."
    echo
    exit 1
fi

[ -d ../cloud-resources/resources/ ] && rm -rf ../cloud-resources/resources/
cp -r $SRC/resources/ ../cloud-resources/

[ -d ../ssl-certs/certs/ ] && rm -rf ../ssl-certs/certs/
cp -r $SRC/certs/ ../ssl-certs/

[ -d ../bosh-deployments/deployments/ ] && rm -rf ../bosh-deployments/deployments/
cp -r $SRC/deployments/ ../bosh-deployments/

[ -f ../bosh-director-deployment/bosh-director-state.json ] && rm -f ../bosh-director-deployment/bosh-director-state.json
cp $SRC/bosh-director-state.json ../bosh-director-deployment/

[ -d ../cloud-configs/configs/ ] && rm -rf ../cloud-configs/configs/
cp -r $SRC/configs/ ../cloud-configs/
