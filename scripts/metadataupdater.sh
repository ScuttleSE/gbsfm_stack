#!/bin/sh
while true
do
	TRACKTAG=`curl -s "https://gbs.fm/api/pltitle2?userid=787&key=6bdc886b6dc2b784187182241d3c7b3d"`
	curl -G --data "mount=/96" \
	        --data "mode=updinfo" \
	        --data-urlencode "song=$TRACKTAG" \
	http://username:password@192.168.0.154:8888/admin/metadata
	curl -G --data "mount=/128" \
	        --data "mode=updinfo" \
	        --data-urlencode "song=$TRACKTAG" \
	http://username:password@192.168.0.154:8888/admin/metadata
	curl -G --data "mount=/192" \
	        --data "mode=updinfo" \
	        --data-urlencode "song=$TRACKTAG" \
	http://username:password@192.168.0.154:8888/admin/metadata
	curl -G --data "mount=/256" \
	        --data "mode=updinfo" \
	        --data-urlencode "song=$TRACKTAG" \
	http://username:password@192.168.0.154:8888/admin/metadata
	curl -G --data "mount=/320" \
	        --data "mode=updinfo" \
	        --data-urlencode "song=$TRACKTAG" \
	http://username:password@192.168.0.154:8888/admin/metadata
	sleep 10
done
