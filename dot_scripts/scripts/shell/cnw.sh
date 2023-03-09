#! /bin/bash
#  File: connect.sh
#  Author: jie
#  TIME: Mon Nov 28 07:19:36 AM CST 2022
#  USAGE: To connect network and unblock rfkill

rfkill unblock all
iwctl station wlan0 connect $(iwctl station wlan0 get-networks |perl -ne "s/\x{001B}.*//g; print if $. > 4" |fzf)
