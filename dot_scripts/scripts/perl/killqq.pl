#! /usr/bin/perl
#  killqq.pl
#  To kill all the processes of QQ, wps and wechat
#  Copyright (Perl) Jie
#  2022-10-13
# 
use 5.26.1;
use utf8;
use strict;
use warnings;

my @processes_qq = `ps aux|grep QQ`;
my @processes_win = `ps aux|grep -i c:`;
my $pid;

foreach (@processes_win) {
    push @processes_qq, $_;
}

foreach (@processes_qq) {
    # print $process . "(sig)";
    $_ =~ s/\w+\s+(\d+)/$1/;
    $pid = $1;
    # print $pid . "\n";
    kill INT => $pid;
}

