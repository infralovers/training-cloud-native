#!/bin/bash

API_IP=$(kubectl get services api  -n 12-factor-app -o jsonpath="{.spec.clusterIP}")

echo "-----------   creating a few entries  ------------"
echo
curl -XPOST "http://${API_IP}:3000/api/products" -H 'Content-Type: application/json' --data '{"name": "MacBook", "price": 999}'
curl -XPOST "http://${API_IP}:3000/api/products" -H 'Content-Type: application/json' --data '{"name": "MacBook Pro", "price": 3999}'
curl -XPOST "http://${API_IP}:3000/api/products" -H 'Content-Type: application/json' --data '{"name": "Surface Pro", "price": 3999}'
echo
echo "-----------   listing all the entries  ------------"
echo
curl "${API_IP}:3000/api/products"
echo

# play with jq!

# sudo snap install jq
# curl -s "${API_IP}:3000/api/products" | jq