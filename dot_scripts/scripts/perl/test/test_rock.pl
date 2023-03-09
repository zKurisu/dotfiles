#! /usr/bin/perl
#  test_rock.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-13
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use My::EasterRock;

my $rock = EasterRock->new();
my $textSource = 'https://www.perlmonks.org/?node_id=639998';
my $imageSource = 'https://orkarin.com/img/wallhaven-5dpvr1_1920x1080.png';
$rock->setTextSource($textSource);  # pass a URL
$rock->setImageSource($imageSource);  # pass a URL (jpg or png)

open my $fh, '>', '/home/jie/scripts/perl/test/test.html';
print {$fh} $rock->getRock('html');  # html, style, div or config
close $fh;
