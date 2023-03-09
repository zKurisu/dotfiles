#! /usr/bin/perl
#  vpn_select.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-08
#
use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use File::Temp qw(tempfile);

my $script_filename = "/home/jie/scripts/data_files/vpn_select";
my $vpn_state_file  = "/home/jie/scripts/data_files/vpn_state";
my $tmp_filename    = "/tmp/vpn_select";

open my $read_script_fh, "<", $script_filename
  or die "Can not open $script_filename";
open my $tmp_fh, ">", $tmp_filename
  or die "Can not create a tmp file";

my @vpn_list   = GetVpnList($script_filename);
my $select_vpn = FzfSelect( \@vpn_list );
UpdateState($select_vpn);
my $count = 0;
while (<$read_script_fh>) {
    my $line = $_;

    if ( $line =~ m/$select_vpn/ and $select_vpn ne 'Close' ) {
        $count = 2;
        print {$tmp_fh} $line;
        next;
    }

    unless ( $count == 0 ) {
        $line =~ s/.*?(export)/export/;
        $count -= 1;
        print {$tmp_fh} $line;
        next;
    }

    $line =~ s/export/\# export/;
    print {$tmp_fh} $line;
}

my $final_content = `cat $tmp_filename`;

open my $write_script_fh, ">", $script_filename
  or die "Can not open $script_filename";

print {$write_script_fh} $final_content;

sub GetVpnList {
    my $script_filename = shift;
    open my $fh, "<", $script_filename
      or die "Can not open $script_filename";
    my @vpn_list = ();
    while (<$fh>) {
        chomp;
        my $line = $_;
        if ( $line !~ m/export/ and $line !~ m/^$/ ) {
            $line =~ s/(?:\#|\s)*//;
            push @vpn_list, $line;
        }
    }
    close $fh;
    return @vpn_list;
}

sub FzfSelect {
    my $vpn_list_ref = shift;
    my ( $tmp_fh, $tmp_filename ) = tempfile();

    local $" = "\n";
    print {$tmp_fh} "@{$vpn_list_ref}";
    return `cat $tmp_filename | fzf`;
}

sub UpdateState {
    my $state = shift;

    open my $fh, ">", $vpn_state_file;
    print {$fh} $state;
}
