#! /usr/bin/perl
#  killWechat.pl
#  To kill all the processes of wechat
#  Copyright (Perl) Jie
#  2022-10-13
# 
use 5.26.1;
use utf8;
use strict;
use warnings;

my @processes_wechat = `ps aux|grep -i wechat`;
my $process;
my $pid;

foreach $process (@processes_wechat) {
    # print $process . "(sig)";
    $process =~ s/\w+\s+(\d+)/\1/;
    $pid = $1;
    # print $pid . "\n";
    kill INT => $pid;
}
