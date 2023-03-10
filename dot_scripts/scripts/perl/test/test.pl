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

my $ip = Net::IP->new('193.0.1/24') or die (Net::IP::Error());
print ("IP  : ".$ip->ip()."\n");
print ("Sho : ".$ip->short()."\n");                                                                                              
