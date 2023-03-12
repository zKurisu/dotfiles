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
use Proc::Daemon;

Proc::Daemon::Init();

while (1) {
    sleep(600);
    system "export PASSWORD_STORE_GPG_OPTS='--pinentry-mode loopback --passphrase 13723786298Zjj'";
    system "mw -Y"
}

