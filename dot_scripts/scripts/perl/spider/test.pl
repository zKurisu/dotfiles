#! /usr/bin/perl
#  test.pl
#
#  spider
#
#  Copyright (Perl) Jie
#  2023-02-12
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use My::Utils;
use LWP::UserAgent;
use Cwd;

my $url = 'https://tiyu.baidu.com/match/nba/tab/';

my $ua = LWP::UserAgent->new;
my $response = $ua->get($url);

my $dir = getcwd;
my $store_file = "$dir/test";
open my $write_fh, '>:utf8', $store_file;

if ($response->is_success) {
    my $content = $response->decoded_content;
    # do something with the content
    print ${write_fh} $content;
}
else {
    die $response->status_line;
}

=head1 Response content
url after "team-row-logo-image" (begin with the second), is the pic of logo
shrink the logo icon and print out

=cut
