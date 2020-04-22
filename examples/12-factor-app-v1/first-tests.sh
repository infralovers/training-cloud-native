#!/bin/bash

# a few commandline REST Requests

# don't repeat yourself!

API_IP=localhost
API_PORT=8080
API_ENDPOINT=http://${API_IP}:${API_PORT}/api

# list current items:

echo "-----------   listing all the entries  ------------"

curl "${API_ENDPOINT}/products"

# play with jq!
# sudo snap install jq

sudo yum install jq -y
curl -s "${API_ENDPOINT}/products" | jq

echo "-----------   creating a few entries  ------------"

curl -XPOST "${API_ENDPOINT}/products" \
-H 'Content-Type: application/json' \
--data-raw '{"name": "MacBook", "price": 999}'

curl -XPOST "${API_ENDPOINT}/products" \
-H 'Content-Type: application/json' \
--data-raw '{"name": "MacBook Pro", "price": 3999}'

curl -s -XPOST "${API_ENDPOINT}/products" \
-H 'Content-Type: application/json' \
--data-raw '{"name": "Surface Pro", "price": 3999}' | jq

echo "-----------   listing all the entries  ------------"

curl -s "${API_ENDPOINT}/products" | jq

echo "-----------   show an entry   ------------"

# get the entry id with jq (https://jqplay.org/)
SURFACE_PRO_ID=$(curl -s "${API_ENDPOINT}/products" | jq --raw-output '.rows[] | select(.name=="Surface Pro")._id')

echo "got the Surface Pro _id: ${SURFACE_PRO_ID}"

curl -s "${API_ENDPOINT}/products/${SURFACE_PRO_ID}" | jq

echo "------------ update an entry --------------"

curl -s -XPUT "${API_ENDPOINT}/products/${SURFACE_PRO_ID}" \
-H 'Content-Type: application/json' \
--data-raw '{"price": 2999}' | jq

curl -s "${API_ENDPOINT}/products/${SURFACE_PRO_ID}" | jq

echo "------------ delete an entry --------------"

curl -s -XDELETE "${API_ENDPOINT}/products/${SURFACE_PRO_ID}" | jq

echo "------------ try again to delete: its gone --------------"

curl -s -XDELETE "${API_ENDPOINT}/products/${SURFACE_PRO_ID}" | jq
