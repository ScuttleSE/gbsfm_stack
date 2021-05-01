#!/bin/bash
cd /socks-irc
nohup perl -I /socks-irc socks.pl 2>/dev/null 1>/dev/null &

supercronic /root/crontab
