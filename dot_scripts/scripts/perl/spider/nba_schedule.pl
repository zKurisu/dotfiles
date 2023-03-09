#! /usr/bin/perl
#  nba_schedule.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-13
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use My::Utils;
use File::Temp qw(tempfile);
use HTML::TreeBuilder;
use LWP::UserAgent;

SetIO();

# 获取 HTML
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0");
my $html = $ua->get("https://tiyu.baidu.com/match/nba/tab/")->decoded_content;

# 创建 HTML 树
my $tree = HTML::TreeBuilder->new;
$tree->parse($html);

# 查找赛程信息
# 时间信息
my @dates = $tree->look_down("class" => "date");

# 赛程数量信息
my @day_game_numbers = map {
    my $number = do {
        $_->as_text =~ m/(\d*)/; 
        $1;
    };
    $number;
} $tree->look_down("class" => "list-num c-color");
# $day_game_numbers[0] -= 1;

# 队名及比分信息
my @games = $tree->look_down("class" => "wa-match-schedule-list-item");
my $game_count = 0;

# 用于保存的临时文件
my ($tmp_fh, $tmp_name) = tempfile();
binmode($tmp_fh, ':utf8');

# 打印赛程信息
foreach my $count (0..@dates-1) {
    my $day_game_number = $day_game_numbers[$count];
    # 打印日期
    say {$tmp_fh} "-----------------" . $dates[$count]->as_text . "-----------------";

    while ($day_game_number > 0) {
        # 打印赛程
        eval {say {$tmp_fh} " " . $games[$game_count]->as_text};
        $day_game_number -= 1;
        $game_count += 1;
    }
}

system("cat $tmp_name");
unlink $tmp_name;

sleep(100);
