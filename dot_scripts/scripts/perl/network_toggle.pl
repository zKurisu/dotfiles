#! /usr/bin/perl
#  network_toggle.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-24
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';

my $choice = `echo -e "Close\nOpen" | fzf`;

if ($choice =~ m/Close/) {
    system "sudo ip link set dev wlan0 down";
}
else {
    system "sudo ip link set dev wlan0 up";
}
