#! /usr/bin/perl
#! /usr/bin/perl
#  test.pl
#
#  
#
#  Copyright (Perl) Jie
#  2023-03-07
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use Data::Dumper;
use Module::CoreList;
use File::Spec::Functions qw(splitdir catdir catfile);
use File::Basename;
use File::Find;

clear();
sub clear {
    my $dir = dirname($ENV{DOTCONFIG});
    my @targets = glob "$dir/*";

    foreach my $target (@targets) {
        if ( $target !~ /(?:json)|(?:.git)/  ) {
            system "rm -rf $target";
            say "rm $target";
        }
    }    
}
