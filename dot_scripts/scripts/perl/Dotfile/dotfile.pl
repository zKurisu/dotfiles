#! /usr/bin/perl
#  dotfile.pl
#
#  To maintain my dotfiles
#  1. adjuge the modification time of the original file
#  2. symbolic link
#  3. backup all the dotfiles
#  4. use a json file to note the dotfiles for searching
#  5. send the directory to remote repository, the repository also maintain in the json file
#
#  Copyright (Perl) Jie
#  2022-12-05
#

use 5.36.0;
use utf8;
use lib '/home/jie/scripts/perl/';
use experimental qw(switch);

# &Main();

sub Main {
    if ( @ARGV == 0 ) {
        say "usage: dm [-a | add] [-e | edit] [-p | push] [-s | show]";
        exit;
    }

    given ( $ARGV[0] ) {
        when ( $_ =~ /(?:--help)|(?:-h)/ ) {
            say "usage: dm [-a | add] [-e | edit] [-p | push] [-s | show]";
            say "-a, add        add dotfile";
            say "-d, deploy     deploy in new env";
            say "-e, edit       edit config file";
            say "-h, help       show help message";
            say "-i, init       init with config file";
            say "-p, push       push to remote";
            say "-u, update     reload the config message";
            say "-s, show       show all dotfile";
        }
        when ( $_ =~ /(?:add)|(?:-a)/ ) {

        }
        when ( $_ =~ /(?:edit)|(?:-e)/ ) {

        }
        when ( $_ =~ /(?:init)|(?:-i)/ ) {

        }
        when ( $_ =~ /(?:push)|(?:-p)/ ) {

        }
        when ( $_ =~ /(?:show)|(?:-s)/ ) {

        }
    }

}

# Set the current direcrory as the repo of dotfile, add a json file, which is used as a config file, it has several parts, when you run
# this program, it will read the json file
sub init {

    # check is already have config file
    my $config_name = 'dotconf';
    if ( -e $config_name ) {
        print "Already have the config file: $config_name \n";
        return;
    }

    # Create config file
    print
"do you want to add a config file to current direcrory? this operation will create a config file [y/n]: ";
    chomp( my $is_init = <STDIN> );
    if ( $is_init == m/y(?:es)?/ ) {
        eval { open my $fh_conf, '>', 'dotconf.json' };
        print "\n Can not init the direcrory: $@ \n";
    }
    else {
        print "The program is stop...\n";
        return;
    }
}

sub backup {

}

sub add {

}

sub delete {

}

sub deploy {

}

sub show {

}

sub update {

}

sub wrong {

}

sub help {    # show the arguments
    my $usage_add    = "Add a dotfile to the list";
    my $usage_delete = "Delete a dotfile from the list";
    my $usage_backup = "Backup the dotfile when adding it to the list";
    my $usage_deploy = "Deploy all dotfiles to remote repository";
    my $usage_show   = "Show the dotfiles in the list";
    my $usage_update = "Update the dotfiles in the list when it is edited";
    my $usage_wrong  = "";

    &help_format($_) for (qw/backup add delete deploy show update wrong help/);
}

sub help_format {
    printf( "%10s\n", $_ );
}
