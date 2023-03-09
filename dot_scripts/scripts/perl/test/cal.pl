#! /usr/bin/perl
#  cal.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-02
#
use 5.36.0;
use utf8;
use bignum;
use lib '/home/jie/scripts/perl/';
use My::Math qw(Cos binary);
use List::Util;
use Math::Utils qw(:utility);
use Math::Trig;
use Math::Matrix;
use constant PI   => pi;
use constant DEG  => 360;
use constant RAD  => 180 / pi; # if you want cos(90^\circ), you can write cos(90 / RAD)
use constant NL   => 2.71828;
use constant H    => 6.63 * 10**(-34);
use constant Hbar => 6.63 * 10**(-34) / ( 2*PI );
use constant E    => 1.61 * 10**(-19);
use constant Em   => 9.11 * 10**(-31);
use constant C    => 3 * 10**8;

say 1/(2 * pi * 10**5);
