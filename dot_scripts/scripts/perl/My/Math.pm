#! /usr/bin/perl
#  Math.pm
#
#  
#
#  Copyright (Perl) Jie
#  2023-02-24
# 
package My::Math;

use feature qw(say);
use List::Util;
use Math::Utils qw(:utility);
use Math::Trig;
use Math::Matrix;
use Exporter qw(import);

our @EXPORT = qw(Cos binary);
our @EXPORT_OK = qw(Cos binary);

sub Cos {
    my $degree = shift;
    my $radian = 180 / pi;
    return cos($degree / $radian);
}

sub binary {
    my ($n) = @_;
    return $n if $n == 0 || $n == 1;

    my $k = int( $n / 2 );
    my $b = $n % 2;
    my $E = binary($k);
    return $E . $b;
}
