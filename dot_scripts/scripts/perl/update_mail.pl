#! /usr/bin/perl
#  update_mail.pl
#
#  Update the contents of my mail without password
#
#  Copyright (Perl) Jie
#  2023-02-10
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use Expect;

my $receive_command = 'mw';
my @receive_command_params = '-Y';
my $passphrase = '13723786298Zjj';

my $exp = Expect->new();
$exp->spawn($receive_command, @receive_command_params);
$exp->expect(10, [qr/Passphrase/]);
$exp->send($passphrase);
