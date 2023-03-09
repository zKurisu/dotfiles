#! /bin/bash
#  Author: jie
#  TIME: Fri Sep 30 08:55:52 AM CST 2022
#  USAGE: To reverse the text
sed -n '{ 1!G ; h ; $p }' $1
