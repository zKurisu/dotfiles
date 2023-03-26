#! /bin/sh
#  Author: jie
#  TIME: Sun Sep 18 03:49:55 PM CST 2022
#  USAGE: Run scripts when dwm is open 
brightnessctl set 25% &
# brightnessctl --device='nvidia_0' 75 &
redshift -P -O 4000 &
picom --experimental-backends --config ~/.config/picom/picom.conf &
zerotier-one -U -d
# xflux -l 30.58 -g 104.07 -k 4000

fcitx5 &
/usr/bin/perl /home/jie/scripts/perl/update_blog.pl 
/usr/bin/perl /home/jie/scripts/perl/update_mail.pl 
/bin/bash ~/scripts/shell/wp-autochange.sh &
/bin/bash ~/scripts/shell/volume_basic.sh &
/bin/bash ~/scripts/shell/dwm_music_play.sh &
