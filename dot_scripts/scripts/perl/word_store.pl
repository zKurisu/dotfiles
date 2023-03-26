#! /usr/bin/perl
#  word_store.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-03-21
# 
# combine the command trans with sql
# when translate a word, storing it to mariadb
# list words with pages
# grep words
# random words
# sort words
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use DBI;
use Getopt::Std;
use Data::Dumper;

my $opt = {};

# 'h' for 'help', 'l' for 'list', 's' for 'search', ''
getopt('hls', $opt);

# print "Hello " . $opt->{a};
# print Dumper($opt);
