#! /usr/bin/perl
#  new.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-27
# 
use utf8;

chomp(my $time = `date +%F`);

print "Enter the course number\n-> ";
chomp(my $num_or_str = <STDIN>);

my $file_name = "${time}_" . $num_or_str . ".md";
system "touch $file_name; nvim $file_name";
