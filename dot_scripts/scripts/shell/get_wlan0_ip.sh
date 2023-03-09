#! /bin/bash
#  Author: jie
#  TIME: Fri Sep 30 10:27:17 AM CST 2022
#  USAGE: Get the ip from wlan0
ifconfig | sed -n '/wlan0/{n; s/.*inet \([0-9.]*\).*/\1/;p}'
