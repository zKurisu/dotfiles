#! /usr/bin/perl
#  chatgpt.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-10
# 
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use LWP::UserAgent;
use HTTP::Request;
use JSON;

my $api_key = "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";
my $prompt = "What is Perl?";

my $ua = LWP::UserAgent->new;

my $request = HTTP::Request->new(POST => "https://api.openai.com/v1/engines/davinci/jobs");
$request->header("Content-Type" => "application/json");
$request->header("Authorization" => "Bearer " . $api_key);

my $post_data = to_json({
    "prompt" => $prompt,
    "max_tokens" => 100,
    "temperature" => 0.5,
});

$request->content($post_data);

my $response = $ua->request($request);

if ($response->is_success) {
    my $content = from_json($response->content);
    my $reply = $content->{"choices"}[0]->{"text"};
    print $reply;
}
else {
    print $response->status_line;
}
