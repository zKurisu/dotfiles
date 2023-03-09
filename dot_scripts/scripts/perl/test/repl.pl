#! /usr/bin/perl
#  repl.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-15
# 
use Devel::REPL;

my $repl = Devel::REPL->new;
$repl->load_plugin($_) for qw(History LexEnv);
$repl->run
