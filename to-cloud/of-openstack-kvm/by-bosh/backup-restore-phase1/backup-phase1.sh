#!/bin/bash

set -e

if [ $# -lt 1 ]; then
    echo
    echo "Error. Missing argument."
    echo
    echo "Usage: $0 <backup dest dir>"
    echo
    exit 1
fi
DEST=$1/phase1

[ -d $DEST ] && rm -rf $DEST
mkdir -p $DEST

cp -r ../cloud-resources/resources $DEST
cp -r ../ssl-certs/certs $DEST
cp -r ../bosh-deployments/deployments $DEST
cp -r ../bosh-director-deployment/bosh-director-state.json $DEST
cp -r ../cloud-configs/configs $DEST
