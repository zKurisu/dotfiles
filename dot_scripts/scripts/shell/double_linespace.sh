#! /bin/bash
#  Author: jie
#  TIME: Fri Sep 30 09:17:41 AM CST 2022
#  USAGE: insert new line
sed '/^$/d; $!G' $1
