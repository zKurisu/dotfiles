#! /usr/bin/perl
#  test.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-03-15
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use Data::Dumper;
use DBI;

my $dsn = 'dbi:mysql:database=test;host=localhost;port=3306';
my $user = 'jie';
my $password = '123456Zjj!';
my $dbh = DBI->connect($dsn, $user, $password,
                       { RaiseError => 1, AutoCommit => 0 }) or die $DBI::errstr;
my $sth = $dbh->prepare_cached("SELECT name from testttt;");
$sth->execute();
while ( my @row = $sth->fetchrow_array ) {
    print "@row\n";
}
$sth->execute();
while ( my @row = $sth->fetchrow_array ) {
    print "@row\n";
}
$dbh->disconnect();
