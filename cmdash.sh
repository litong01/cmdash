#!/bin/bash
#
# Usage: ./cmcc.sh orgName port channel_name chaincode_name
#   For example: ./cmdash.sh org0 8080 interopchannel0  cmcc
#
docker run -d -v $(pwd)/keyfiles/$1:/cmdash \
  -v $(pwd)/keyfiles:/fabric/keyfiles \
  -e org=$1 -e profile=/cmdash/connection.yml \
  -e channel=$3 -e chaincode=$4 -e port=8080 \
  -e cert=/cmdash/users/Admin@$1/msp/admincerts/Admin@$1-cert.pem \
  -e key=/cmdash/users/Admin@$1/msp/keystore/admin_private.key \
  -p $2:8080  --name cli$1 hfrd/cmdash:latest
