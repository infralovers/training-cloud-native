#!/bin/bash

API_IP=$(kubectl get services api  -n 12-factor-app -o jsonpath="{.spec.clusterIP}")

echo "-----------   creating a few entries  ------------"
echo
curl -XPOST "http://${API_IP}:3000/api/products" -H 'Content-Type: application/json' --data '{"name": "MacBook", "price": "not"}' | jq
curl -XPOST "http://${API_IP}:3000/api/products" -H 'Content-Type: application/json' --data '{"name": "MacBook Pro", "price": "working"}' | jq
curl -XPOST "http://${API_IP}:3000/api/products" -H 'Content-Type: application/json' --data '{"name": "Surface Pro", "price": "string"}' | jq
curl -XPOST "http://${API_IP}:3000/api/product" -H 'Content-Type: application/json' --data '{"name": "MacBook", "price": "not"}' | jq
echo
echo "-----------   errors expected all the entries  ------------"
echo
