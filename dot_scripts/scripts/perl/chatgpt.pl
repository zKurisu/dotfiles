#! /usr/bin/perl
#  chatgpt.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-10
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use My::Chat;
use My::Utils;

SetIO();
my $response;

while ($response = Ask($response)) {
    Answer($response);
}
