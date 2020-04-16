#!/bin/bash

API_IP=$(kubectl get services api  -n 12-factor-app -o jsonpath="{.spec.clusterIP}")

echo "-----------   creating a few entries  ------------"

curl -XPOST "http://${API_IP}:3000/api/products" \
-H 'Content-Type: application/json' \
--data-raw '{"name": "MacBook", "price": 999}'
curl -XPOST "http://${API_IP}:3000/api/products" \
-H 'Content-Type: application/json' \
--data-raw '{"name": "MacBook Pro", "price": 3999}'
curl -XPOST "http://${API_IP}:3000/api/products" \
-H 'Content-Type: application/json' \
--data-raw '{"name": "Surface Pro", "price": 3999}'

echo "-----------   listing all the entries  ------------"

curl "${API_IP}:3000/api/products"

# play with jq!

# sudo snap install jq
# curl -s "${API_IP}:3000/api/products" | jq