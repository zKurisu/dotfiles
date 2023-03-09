#! /usr/bin/perl
#  Test.pm
#
#  
#
#  Copyright (Perl) Jie
#  2023-01-28
# 
package My::Test;
# use overload;
use warnings::register;

sub import {
    warnings::warn( __PACKAGE__ . ' used with empty import list' )
        if @_ == 0 && warnings::enabled();
}

sub Hello {
    print "Hello!";
}

sub T_Warn {
    warnings::warn("warninig coming") if warnings::enabled();
}
# sub import {
#     overload::constant(
#         integer => \&handler,
#     );
# }
#
# sub handler {
#     my $integer = shift;
#     return $integer * 10;
# }


1;
