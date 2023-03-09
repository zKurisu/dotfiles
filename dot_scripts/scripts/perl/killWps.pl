#! /usr/bin/perl
#  killWps.pl
#  To kill all the processes of wps
#  Copyright (Perl) Jie
#  2022-10-13
# 
use 5.26.1;
use utf8;
use strict;
use warnings;

my @processes_wps = `ps aux|grep wps`;
my @processes_win = `ps aux|grep C:`;
my $pid;

foreach (@processes_win) {
    push @processes_wps, $_;
}

foreach (@processes_wps) {
    # print $process . "(sig)";
    $_ =~ s/\w+\s+(\d+)/$1/;
    $pid = $1;
    kill KILL => $pid;
}
