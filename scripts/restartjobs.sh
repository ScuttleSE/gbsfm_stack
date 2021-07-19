#!/bin/bash

HOST=https://drone.hemma.lokal/api/repos/
USERNAME=scuttle
JOB=$1
AUTHKEY=DRONE_JOBKEY


curl -ik -X POST -i $HOST$USERNAME/$JOB/builds -H "Authorization: Bearer $AUTHKEY"