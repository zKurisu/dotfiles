#! /bin/bash
#  Author: jie
#  TIME: Fri Sep 30 09:21:34 AM CST 2022
#  USAGE: Add number to each line
sed '=' $1 | sed 'N; s/\n/ /'
