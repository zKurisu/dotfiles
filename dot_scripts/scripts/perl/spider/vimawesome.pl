#! /usr/bin/perl
#  vimawesome.pl
#
#  api of vimawesome
#
#  Copyright (Perl) Jie
#  2023-03-13
# 
# message: VimAwesome 的 search 界面用如
# https://vimawesome.com/api/plugins?query=git&page=1
# 返回的是一个 json 文件
# 其包含有每一页的 plug 数量以及总的页数
# Show name, url, description, github stars
use 5.36.0;
use utf8;
use Data::Dumper;
use JSON;
use LWP::UserAgent;

print "Key words: ";
chomp(my $target = <STDIN>);
print "Page? ";
chomp(my $want_page = <STDIN>);

my $api = "https://vimawesome.com/api/plugins?query=";
my $url = $api . $target;

my $ua = LWP::UserAgent->new();
$ua->agent("Mozilla/5.0");
my $json = JSON->new();

if ($want_page) {
    visit_page($want_page);
} 
else {
    my $total_pages = get_total_pages();

    if ($total_pages > 1) {
        for my $page_number (2..$total_pages) {
            visit_page($page_number);
        }
    }
}

sub visit_page {
    my $page_number = shift;
    my $url_with_num = $url . "&page=" . $page_number;

    my $json_content = $ua->get($url_with_num)->decoded_content;
    my $perl_content = $json->decode($json_content);

    say "Page $page_number";
    say "=================================";
    plugs_handle($perl_content);
    say "=================================";
    return $perl_content;
}

sub get_total_pages {
    my $perl_content = visit_page(1);

    my $total_pages = $perl_content->{total_pages};
    return $total_pages
}

sub plugs_handle {
    my $perl_content = shift;
    my $plug_amount = $#{$perl_content->{plugins}};

    foreach (0..$plug_amount) {
        my $plug_name = $perl_content->{plugins}[$_]{name} // '';
        my $plug_desc = $perl_content->{plugins}[$_]{vimorg_short_desc} // '';
        my $plug_star = $perl_content->{plugins}[$_]{github_stars} // '';
        my $plug_repo = $perl_content->{plugins}[$_]{github_url} // '';

        binmode(STDOUT, ":utf8");
        say $_+1 . ".";
        say "   \e[32mPlug Name   :\e[0m $plug_name";
        say "   \e[32mDescription :\e[0m $plug_desc";
        say "   \e[32mGithub⭐Star:\e[0m $plug_star";
        say "   \e[32mGithub Repo :\e[0m $plug_repo";
    }
}
