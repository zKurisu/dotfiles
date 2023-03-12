#! /usr/bin/perl
#  Chat.pm
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-10
# 
package My::Chat;

use OpenAI::API;
use feature qw(say state);
use Exporter 'import';

our @EXPORT = qw(Ask Answer SetIO);

sub Ask {
    say "You ask: ";
    print "-> ";
    state $question .= <>;

    if ($question =~ m/(?:CLEAR)|\bC\b/) {
        say "Clear the previous questions...";
        $question = undef;
        say "You ask: ";
        print "-> ";
        $question = <>
    }
    elsif ($question =~ m/(?:OVER)|O/) {
        return 0;
    }

    my $openai = OpenAI::API->new( api_key => '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' );
    
    say "Waiting for the response...";

    my $response = $openai->completions(
        model             => 'text-davinci-003',
        # model             => 'gpt-3.5-turba',
        # model             => 'whisper-2',
        prompt            => ${question},
        max_tokens        => 2048,
        temperature       => 0.5,
        top_p             => 1,
        frequency_penalty => 0,
        presence_penalty  => 0
    );

    return $response->{'choices'}->[0]->{'text'};
}

sub Answer {
    my $answer = shift;
    $answer =~ s/^\s*//;
    # say "Response:";
    say "--------------------------------------------------------------";
    say "GPT response:\n-> $answer";
    say "--------------------------------------------------------------";
}

