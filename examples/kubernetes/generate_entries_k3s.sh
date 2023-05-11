#!/bin/bash

K3S_DOMAIN=k8s.${ENVIRONMENT}-${USER_ID}-01.${ANIMAL}.${DOMAIN}

echo "-----------   creating a few entries  ------------"
echo
curl -XPOST "http://${K3S_DOMAIN}/api/products" -H 'Content-Type: application/json' --data '{"name": "MacBook", "price": 999}'
curl -XPOST "http://${K3S_DOMAIN}/api/products" -H 'Content-Type: application/json' --data '{"name": "MacBook Pro", "price": 3999}'
curl -XPOST "http://${K3S_DOMAIN}/api/products" -H 'Content-Type: application/json' --data '{"name": "Surface Pro", "price": 3999}'
echo
echo "-----------   listing all the entries  ------------"
echo
curl "http://${K3S_DOMAIN}/api/products"
echo

# play with jq!

# sudo snap install jq
# curl -s "http://${K3S_DOMAIN}/api/products" | jq
