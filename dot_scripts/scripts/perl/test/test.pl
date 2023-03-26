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
use My::Test;
use test::Employee;
use Data::Dumper;
use Module::CoreList;
use File::Spec::Functions qw(splitdir catdir catfile);
use File::Basename;
use File::Find;
use Term::ReadKey;

my $num = getprotobyname(0);
print $num;
