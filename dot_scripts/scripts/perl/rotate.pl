#! /usr/bin/perl
#  rotate.pl
#  To rotate the picture
#  Copyright (Perl) Jie
#  2022-10-23
# 
use 5.26.1;
use utf8;
use strict;
use warnings;
use Image::Magick;
use File::Temp;

my @pictures = glob '*.png *.jpg';
my $picture;
if (@pictures < 10) {
    my $count = 1;

    foreach (@pictures) {
        say "$count. $pictures[$count-1]";
        $count++;
    }

    print "Chose a number: ";
    chomp(my $choise = <STDIN>);
    $picture = $pictures[$choise-1];
}
else {
    my ($tmp_fh, $tmp_name) = tmpfile();
    {
        local $" = "\n";
        print {$tmp_fh} "@pictures";
    }
    chomp($picture = `fzf $tmp_name`);
}

print "Enter the angle: ";
chomp(my $angle = <STDIN>);

system("(feh $picture)&");
my $pid = `pidof feh`;

my $response = 'y';
while ($response =~ m/^(?:y|Y|\n)$/) {
    # system "convert -rotate $angle $pictures[$choise] $pictures[$choise]";
    my $image = Image::Magick->new;
    $image->Read($picture);
    $image->Rotate(degree=>$angle);
    $image->Write($picture);
    say "Continue? [y/n]";
    $response = <>;
}

system("kill $pid");
