#! /usr/bin/perl
#  update_minicpan.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-21
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use CPAN::Mini;

CPAN::Mini->update_mirror(
    remote => "http:://cpan.metacpan.org",
    local => "/home/jie/Disk/MiniCPAN"
)
