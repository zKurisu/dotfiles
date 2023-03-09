#! /usr/bin/perl
#  unpack.pl
#
#  test unpack
#
#  Copyright (Perl) Jie
#  2023-02-24
# 
use utf8;
use lib '/home/jie/scripts/perl/';
use Data::Dumper;

my $string = <<'COLUMNAR';
ID  First Name  Middle  Last Name
1   brian       d       foy
2   Joshua              McAdams
3   Joseph      N       Hall
COLUMNAR

open my ($fh), '<', \$string;

my $format = 'A2 @4 A10 @16 A6 @24 A*';

my @headers = unpack $format, <$fh>; # Get the first line

my @name;

while (<$fh>) { # Get the left lines
    my %hash;
    @hash{ @headers } = unpack $format, $_;
    push @names, \%hash;
}

print Dumper( @names );


