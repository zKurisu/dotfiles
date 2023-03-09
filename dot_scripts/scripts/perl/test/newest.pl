#! /usr/bin/perl
#  newest.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-02
#
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';

my $blog_dir = '/home/jie/Blog/source/_posts';
chdir $blog_dir;


my @today_update = map { s/\.md//; $_ } grep { 1 > -M } glob "*";
local $" = "\n";
print foreach keys(%::);
print "@today_update";
