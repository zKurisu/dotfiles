#! /bin/bash
#  Author: jie
#  TIME: Sun Sep 18 08:22:51 AM CST 2022
#  USAGE: To Restart the dwm 
while true; do
    # Log stderror to a file 
    dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done
