#! /usr/bin/perl
#  zerotier_state.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-03-21
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use LWP::UserAgent;

my $ua = LWP::UserAgent->new();
$ua->agent("Mozilla/5.0");
