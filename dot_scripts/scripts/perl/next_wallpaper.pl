#! /usr/bin/perl
#  next_wallpaper.pl
#  To change the background to the next picture in /home/jie/Gitrepo/mybgd
#  Copyright (Perl) Jie
#  2022-10-13
# 
use 5.26.1;
use utf8;
use strict;
use warnings;

chdir '/home/jie/Disk/Gitrepo/mybgd' or die "cannot chdir to /home/jie/Disk/Gitrepo/mybgd";

my @wallpapers = glob '*';
my $arr_len = @wallpapers;

exec 'xwallpaper', '--zoom', "$wallpapers[int(rand($arr_len))]";

# if ($? != 0) {
#     print "cannot change the background!";
# }
