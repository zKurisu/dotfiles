#! /usr/bin/perl
#! /usr/bin/perl
#  test.pl
#
#  
#
#  Copyright (Perl) Jie
#  2023-03-07
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use Data::Dumper;
use Module::CoreList;
use File::Spec::Functions qw(splitdir catdir catfile);
use File::Basename;
use File::Find;
use Net::IP;
use Getopt::Std;

getopt("v:");

{
    no strict;
    no warnings;
    say "Hello, your option is [$opt_v]";
}
