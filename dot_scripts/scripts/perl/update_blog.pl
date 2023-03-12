#! /usr/bin/perl
#  log_github.pl
#
#  Using to log github without enter passwd
#
#  Copyright (Perl) Jie
#  2023-02-10
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use Expect;
use Proc::Daemon;

Proc::Daemon::Init();

my $blog_dir = '/home/jie/Blog';
my $hexo = 'hexo';
my @hexo_params = qw(d);
my $username = 'zKurisu';
my $pat = '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';
chdir $blog_dir;
system("(hexo s)&");

while (1) {
    sleep(1800);
    system("hexo g");

    my $exp = Expect->new();
    $exp->spawn($hexo, @hexo_params);
    $exp->expect(10, [qr/Username/]);
    $exp->send("$username\n");
    $exp->expect(10, [qr/Password/]);
    $exp->send("$pat\n");
    $exp->expect(10, [qr/Deploy done/]);
    $exp->send("Finish!");
}
