#!/bin/bash

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

certs=$(dirname $0)/certs
rm -rf $certs && mkdir -p $certs
cd $certs

echo "Generating CA..."
openssl genrsa -out rootCA.key 2048
yes "" | openssl req -x509 -new -nodes -key rootCA.key -out rootCA.pem -days 99999

function generateCert {
  local name=$1
  local ip=$2

  cat >openssl-exts.conf <<-EOL
extensions = san
[san]
subjectAltName = IP:${ip}
EOL

  echo "Generating private key..."
  openssl genrsa -out ${name}.key 2048

  echo "Generating certificate signing request for ${ip}..."
  # golang requires to have SAN for the IP
  openssl req -new -nodes -key ${name}.key \
    -out ${name}.csr \
    -subj "/C=US/O=BOSH/CN=${ip}"

  echo "Generating certificate ${ip}..."
  openssl x509 -req -in ${name}.csr \
    -CA rootCA.pem -CAkey rootCA.key -CAcreateserial \
    -out ${name}.crt -days 99999 \
    -extfile ./openssl-exts.conf

  echo "Deleting certificate signing request and config..."
  rm ${name}.csr
  rm ./openssl-exts.conf
}

generateCert director $BDIP # <--- Replace with public Director IP
generateCert uaa-web $BDIP  # <--- Replace with public Director IP
generateCert uaa-sp $BDIP   # <--- Replace with public Director IP

echo "Finished..."
