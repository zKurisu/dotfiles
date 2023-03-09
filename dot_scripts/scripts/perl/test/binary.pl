#! /usr/bin/perl
#  binary.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-15
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';

print binary(4);

sub binary {
    my ($n) = @_;
    return $n if $n == 0 || $n == 1;

    my $k = int($n/2);
    my $b = $n % 2;
    my $E = binary($k);
    return $E . $b;
}
