#!/bin/bash

USERNAME=admin
PASSWORD=Aladdin5
HOST=https://portainer.hemma.lokal
#SERVICE_NAME=botstack_socks-linkbot
SERVICE_NAME=botstack_shoes-docker
#IMAGE_NAME=gitlab.hemma.lokal:5005/scuttle/socks-linkbot:latest
IMAGE_NAME=gitlab.hemma.lokal:5005/scuttle/shoes-docker:latest
SERVICE_NAME=$1
IMAGE_NAME=$2

LOGIN_TOKEN=$(curl -k -s -H "Content-Type: application/json" -d "{\"username\":\"$USERNAME\",\"password\":\"$PASSWORD\"}" -X POST $HOST/api/auth | jq -r .jwt)

ENDPOINT_ID=$(curl -k -s -H "Authorization: Bearer $LOGIN_TOKEN" $HOST/api/endpoints | jq ."[].Id")

SERVICE=$(curl -k -s -H "Authorization: Bearer $LOGIN_TOKEN" $HOST/api/endpoints/${ENDPOINT_ID}/docker/services | jq -c ".[] | select( .Spec.Name==(\"$SERVICE_NAME\"))")

ID=$(echo $SERVICE | jq  -r .ID)
SPEC=$(echo $SERVICE | jq .Spec)
VERSION=$(echo $SERVICE | jq .Version.Index)
UPDATE=$(echo $SPEC | jq ".TaskTemplate.ContainerSpec.Image |= \"$IMAGE_NAME\" " | jq ".TaskTemplate.ForceUpdate |= $RANDOM ")

echo $UPDATE

curl -k -s -H "Content-Type: text/json; charset=utf-8" \
-H "Authorization: Bearer $LOGIN_TOKEN" -X POST -d "${UPDATE}" \
"$HOST/api/endpoints/${ENDPOINT_ID}/docker/services/$ID/update?version=$VERSION"