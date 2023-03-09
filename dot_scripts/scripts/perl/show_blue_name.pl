#! /usr/bin/perl
#  show_blue_name.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-01-28
#
use 5.36.0;
use utf8;

my $hcitool_output      = `hcitool con`;
my $bluetoothctl_output = `bluetoothctl devices`;

my ($connect_MAC)  = $hcitool_output =~ m/([A-Z]{2}:.*? )/;
my ($connect_name) = $bluetoothctl_output =~ m/$connect_MAC(.*)/ if $connect_MAC;

print $connect_name // 'no device';
