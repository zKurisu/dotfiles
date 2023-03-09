#! /bin/bash
#  Author: jie
#  TIME: Sun Sep 18 03:32:45 PM CST 2022
#  USAGE: To test if we can use ls command to create an array
for picture in $(ls ~/Gitrepo/mybgd/*)
do
    echo $picture
done
