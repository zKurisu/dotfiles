#! /usr/bin/perl
#  fork.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-12
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';

say "Hello";
my $pid = fork();

if ($pid) {
  # Parent process
  print "This is the parent process $$\n";
  say "The value of \$pid know is $pid";
  # Do some processing here
} else {
  # Child process
  print "This is the child process $$\n";
  say "The value of \$pid know is $pid";
  # Do some processing here
}
