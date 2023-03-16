#! /usr/bin/perl
#  Utils.pm
#
#  Containing many useful utils
#
#  Copyright (Perl) Jie
#  2023-01-29
#
package My::Utils;
use Image::Magick;
use Carp;
use File::Slurp;
use File::Spec::Functions;
use Exporter 'import';

our @EXPORT = qw(SetIO ShowHash ShowArray RandArray);
our @EXPORT_OK = qw(edit_env);

# ShrinkPic('/tmp/logo.png');

sub ShowIP {
    use Socket;
    use Sys::Hostname;

    return inet_ntoa( scalar gethostbyname(hostname) );
}

sub SetIO {
    binmode( STDOUT, ":utf8" );
    binmode( STDIN,  ":utf8" );
}

sub ShrinkPic {
    my $img_file = shift;
    my $size     = '100x100';
    my $img      = Image::Magick->new;

    $img->Read($img_file);
    $img->Resize( geometry => $size );
    $img->Write($img_file);
}

sub ShowHash {
    my $hash_ref = shift;
    print "$_\n" foreach ( %{$hash_ref} );
}

sub ShowArray {
    my $array_ref = shift;
    foreach ( 0 .. @{$array_ref} - 1 ) {
        my $count = $_ + 1;
        print "$count. ";
        print $array_ref->[$_] . "\n";
    }
}

sub RandArray {
    my $array_ref = shift;
    my $count       = shift // @{$array_ref};
    my $num         = $count;

    while ($count > 0 && $count <= @{$array_ref}) {
        print $num-$count+1 . ".";
        print $array_ref->[rand(@{$array_ref})] . "\n";
        $count -= 1;
    }

}


# sub add_env {
#     my $var_name    = shift;
#     my $var_value   = shift;
#     my $description = shift // "#";
#
#     my $env_path;
#
#     if ( $ENV{SHELL} =~ m/zsh/ and !defined $ENV{$var_name} ) {
#         $env_path = catfile( $ENV{HOME}, '.zshenv' );
#     }
#     else {
#         $env_path = catfile( $ENV{HOME}, '.bashrc' );
#     }
#     open my $fh, '>>', $env_path
#       or carp "Can not open $env_path";
#     print {$fh} "\n# $description\n";
#     print {$fh} "export $var_name=\"$var_value\"";
# }

sub edit_env {
    my $var_name    = shift;
    my $var_value   = shift;
    my $description = shift // "#";
    my $env_path;
    my @result;

    if ( $ENV{SHELL} =~ m/zsh/ ) {
        $env_path = catfile( $ENV{HOME}, '.zshenv' );
    }
    else {
        $env_path = catfile( $ENV{HOME}, '.bashrc' );
    }

    my @text = read_file($env_path);
    unless ($ENV{$var_name}) {
        my @add_content = ("\n# $description\n", "export $var_name=\"$var_value\"");
        push @text, $add_content[$_] foreach 0..@add_content-1;
        @result = @text;
    }
    else {
        @result = map { 
            $_ =~ s!($var_name=).*!$1\"$var_value\"!;
            $_;
        } @text;
    }

    print Dumper(@result); 
    write_file($env_path, @result);
}

sub color {
    my $full_string = shift;
    my $color_string =  shift;
}

sub module_check {
    use Test::More;
    if ( !defined $ARGV[0] or $ARGV[0] eq '-c' or $ARGV[0] eq 'check') {
        my @modules = @_; 
        my $count = @modules;
        my ($state, @lack_modules);

        foreach my $module (@modules) {
            is($state = eval "require $module", 1, "Load $module");
            if ( $state == 0 ) {
                CORE::push @lack_modules, $module;
            }
        }

        done_testing($count);
        my $failed = Test::Builder->new->{Stack}->[0]->{failed};
        if ($failed > 0) {
            print "\e[31m[Please install the dependences]\e[0m\n";
            print "Do you want install them now? [y/n]";
            my $choice = <STDIN>;
            if ( $choice =~ m/[yY]/ or $choice eq "\n" ) {
                foreach my $module (@lack_modules) {
                    system "cpanm $module";
                }
            }
            else {
                print "\n Exit...";
            }
            exit;
        }
    }
}

sub easy_pack {

}
