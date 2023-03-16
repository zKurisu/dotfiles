#! /usr/bin/perl
#! /usr/bin/perl
#  test.pl
#
#  
#
#  Copyright (Perl) Jie
#  2023-03-07
# 
use utf8;
use lib '/home/jie/scripts/perl/';
use Data::Dumper;
use Module::CoreList;
use File::Spec::Functions qw(splitdir catdir catfile);
use File::Basename;
use File::Find;
use Term::ReadKey;

my $obj = [3,5];
print ref($obj), " ", $obj->[1], "\n";
bless($obj, "Human::Cannibal");
print ref($obj), " ", $obj->[1], "\n";
