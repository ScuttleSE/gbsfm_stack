#!/bin/bash

while true
do
	curl -s http://username:password@192.168.0.154:8888/admin/stats| awk -F"[<>]" '{print $33}'|tr -d '\n' > /home/gbsfm/listeners.txt
	sleep 30
done
