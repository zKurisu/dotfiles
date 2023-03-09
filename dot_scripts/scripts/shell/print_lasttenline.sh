#! /bin/bash
#  Author: jie
#  TIME: Fri Sep 30 09:34:27 AM CST 2022
#  USAGE: print last ten line of a file
sed '{
:start
$q
N
11,$D
b start
}' $1
