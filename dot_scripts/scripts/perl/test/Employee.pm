package test::Employee;

use lib '/home/jie/scripts/perl/';
use test::Person;
@ISA = ("test::Person");

sub AUTOLOAD {
    print "The function $AUTOLOAD does not exists!\n";
}
1;
