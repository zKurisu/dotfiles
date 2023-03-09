#! /usr/bin/perl
#  change_keycode.pl
#
#  change key code stored in file /usr/share/X11/xkb/keycodes/evdev
#
#  Copyright (Perl) Jie
#  2023-02-15
# 
use 5.36.0;
use utf8;
use autodie;
use File::Slurper 'read_lines';
use lib '/home/jie/scripts/perl/';

my $ori_file = '/usr/share/X11/xkb/keycodes/evdev';
my $new_file = '/home/jie/Documents/backups/evdev';
unlink $ori_file;
link $new_file, $ori_file;
# my @lines = read_lines($file);
#
# open my $fh, '>', $file
#     or die "Can not open $file, $!";
#
# foreach my $line (@lines) {
#     {
#         local $1;
#         $line =~ s/(<CAPS> =) \d+/$1 37/;
#     }
#     {   local $1;
#         $line =~ s/(<LCTL> =) \d+/$1 66/;
#     }
#     print {$fh} $line;
# }
