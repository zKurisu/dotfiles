#! /usr/bin/perl
#  test_hash.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-24
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use Data::Dumper;

my @keys = qw(A B C D E F);
my @values = (1, 2, 3, 4, 5, 6);
my %hash;
@hash{ @keys } = @values;
print $hash{A};
