#! /bin/bash
#  File: snw.sh
#  Author: jie
#  TIME: Thu Dec  1 07:21:25 AM CST 2022
#  USAGE: To show the network

rfkill unblock all
iwctl station wlan0 scan
iwctl station wlan0 get-networks
