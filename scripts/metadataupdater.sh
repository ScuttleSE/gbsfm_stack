#!/bin/sh
while true
do
	TRACKTAG=`curl -k -s "https://gbs.fm/api/pltitle2?userid=XXX&key=YYY"`
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
