#!/bin/bash

K3S_DOMAIN=k8s.${ENVIRONMENT}-${USER_ID}-01.${ANIMAL}.${DOMAIN}

echo "-----------   creating a few entries  ------------"
echo
curl -XPOST "http://${K3S_DOMAIN}/api/products" -H 'Content-Type: application/json' --data '{"name": "MacBook", "price": "not"}' | jq
curl -XPOST "http://${K3S_DOMAIN}/api/products" -H 'Content-Type: application/json' --data '{"name": "MacBook Pro", "price": working}' | jq
curl -XPOST "http://${K3S_DOMAIN}/api/products" -H 'Content-Type: application/json' --data '{"name": "Surface Pro", "price": "string"}' | jq
curl -XPOST "http://${K3S_DOMAIN}/api/product" -H 'Content-Type: application/json' --data '{"name": "MacBook", "price": "not"}' | jq
echo
echo "-----------   errors expected all the entries  ------------"
echo
