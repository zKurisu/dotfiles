#! /bin/bash
#  Author: jie
#  TIME: Fri Sep 30 10:13:21 AM CST 2022
#  USAGE: 
if [[ ! -e $HOME/.config ]]; then
    echo oh
else 
    echo ok
fi
git clone --branch master https://github.com/zKurisu/nvim.git 
