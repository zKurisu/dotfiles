#! /usr/bin/perl
#  scheduled_task.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-12
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use Proc::Daemon;

Proc::Daemon::Init();
chdir "/home/jie/Blog";
system("(hexo s)&");

while (1) {
    sleep(1800);
    system("/home/jie/scripts/perl/update_blog.pl");
}
