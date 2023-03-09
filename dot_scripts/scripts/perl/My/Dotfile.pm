# 删除内部文件的 .git 目录
# 安装软件

package My::Dotfile;

BEGIN {
    use Test::More;
    if ( !defined $ARGV[0] or $ARGV[0] eq '-c' or $ARGV[0] eq 'check') {
        my @modules = qw(JSON Carp File::Spec::Functions File::Basename 
            File::Find List::MoreUtils Expect Data::Structure::Util);
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
                print "\n Exit dm...";
            }
            exit;
        }
    }
}

use 5.36.0;
use JSON;
use Carp;
use File::Spec::Functions qw(splitdir catdir catfile);
use File::Basename;
use File::Find;
use List::MoreUtils qw( pairwise );
use Expect;
use Data::Structure::Util qw( unbless );
use experimental          qw(switch);

my $g_class          = 'My::Dotfile';
my $template_content = <<'TEMP';
{
    "user" : "",
    "password" : "",
    "update time" : "", 
    "last push time" : "",
    "description" : "my dotfiles",
    "config name" : "config.json",
    "dotfiles" : {
    },
    "repository" : ""
}
TEMP

if ( !$ENV{DOTCONFIG} or !-f $ENV{DOTCONFIG} ) {
    create_template();
}
# else {
#     print "You already have the config file in:\n\n-> [ $ENV{DOTCONFIG} ] <-\n"
# }
my $g_file_path = $ENV{DOTCONFIG};
my $g_dir       = dirname($g_file_path);
my $g_file_name = basename($g_file_path);

my $dotfiles = My::Dotfile->new();
Main($dotfiles);
# $dotfiles->link_all();

sub Main {
    my $self = shift;

    if ( $ARGV[0] ) {
        given ( $ARGV[0] ) {
            when ( $_ =~ /(?:--help)|(?:-h)/ ) {
                say "usage: dm [-c | check] [-e | edit] [-h | help] [-i | init] [-l | link] [-p | push] [-u | update] [-r | remove] [-s | show]";

                # say "-a, add        add dotfile";
                say "-c, check      check the dependences";
                say "-C, clear      clear the stored files";
                say "-d, deploy     deploy in new env";
                say "-e, edit       edit config file";
                say "-h, help       show help message";

                # say "-i, init       init with config file";
                say "-l, link       link all dotfiles";
                say "-p, push       push to remote";
                say "-u, update     reload the config message";
                say "-r, remove     remove the dir does not in you config";
                say "-s, show       show all dotfile";
            }

            # when ( $_ =~ /(?:add)|(?:-a)/ ) {
                #
                # }
            when ( $_ =~ /(?:clear)|(?:-C)/ ) {
                $self->clear();
            }
            when ( $_ =~ /(?:deploy)|(?:-d)/ ) {
                $self->deploy();
            }
            when ( $_ =~ /(?:edit)|(?:-e)/ ) {
                $self->edit_config();
            }

            # when ( $_ =~ /(?:init)|(?:-i)/ ) {
                #
                # }
            # when ( $_ =~ /(?:init)|(?:-i)/ ) {
            #     $self->create_template();
            # }
            when ( $_ =~ /(?:link)|(?:-l)/ ) {
                $self->link_all();
            }
            when ( $_ =~ /(?:push)|(?:-p)/ ) {
                $self->push();
            }
            when ( $_ =~ /(?:update)|(?:-u)/ ) {
                $self->update();
            }
            when ( $_ =~ /(?:remove)|(?:-r)/ ) {
                $self->remove();
            }
            when ( $_ =~ /(?:show)|(?:-s)/ ) {
                $self->ls_app("output");
            }
        }
    }
    else {
        say "You can use \e[32m-h option\e[0m to see the usage";
    }
}
#
# #
sub new {
    my $class     = shift;
    my $file_path = shift // $g_file_path;

    my $json      = JSON->new;
    my $json_text = do {
        open my $fh_config_file, '<:encoding(UTF-8)', $file_path;
        croak "can't open $file_path: $!" if $?;
        local $/;
        # return the content of configure file
        <$fh_config_file>;
    };
    my $json_text_ref = $json->decode($json_text);

    bless $json_text_ref => $class;
    return $json_text_ref;
}

sub get_section_content {
    my $self         = shift;
    my $section_name = shift // "dotfiles";
    is_hashref_has_key( $self, $section_name );

    if ( ref $self->{$section_name} eq 'HASH' ) {
        return \%{ $self->{$section_name} };
    }
    else {
        return $self->{$section_name};
    }
}
#
# # check is the key exists in a hash by a hash ref
sub is_hashref_has_key {
    my $hash_ref   = shift;
    my $check_name = shift;

    exists $hash_ref->{$check_name}
      or croak "can not find $check_name in config file: $!";
}

sub ls_sections {
    my $self = shift;

    if ($self) {
        print "$_\n" foreach keys %$self;
    }
    else {
        carp "error **Please enter ref of file**";
    }
}

sub ls_app {
    my $self     = shift;
    my $option   = shift // "no output";
    my $hash_ref = $self->get_section_content();

    if ( $option eq "output" ) {
        print "$_\n" foreach values %$hash_ref;
    }
    else {
        return keys %$hash_ref;
    }
}

sub ls_dotfiles {
    my $self     = shift;
    my $option   = shift // "no output";
    my $hash_ref = $self->get_section_content();

    if ( $option eq "output" ) {
        print "$_\n" foreach values %$hash_ref;
    }
    else {
        return values %$hash_ref;
    }
}

sub add_dotfile {
    my $self      = shift;
    my $app_name  = shift;
    my $file_name = shift;
    $self->{dotfiles}->{$app_name} = $file_name;

    unbless $self;
    my $json = JSON->new;
    open my $fh, '>', $g_file_path;
    print {$fh} $json->pretty->encode($self);
}

sub link_all {
    my $self      = shift;
    my @stored_dotfiles  = $self->ls_dotfiles();
    my @app_names = map { "dot_" . $_ } $self->ls_app();

    my @want_dotfiles = map {
        my @dirs = splitdir($_);
        if ($dirs[0] eq '~') {
            $dirs[0] = $ENV{HOME};
        } 
        elsif ($dirs[1] =~ /home/) {
            $dirs[2] = $ENV{USER};
        }
        catfile(@dirs);
    } @stored_dotfiles;
    my @target_files =
      pairwise { catfile( $g_dir, $a, basename($b) ) }
        @app_names, @want_dotfiles;
    my @new_dir = map { dirname($_) } @target_files;

    foreach ( 0 .. @target_files - 1 ) {
        if ( -e $target_files[$_] ) {
            say "$target_files[$_] \e[32m[already exists]\e[0m";
        }
        elsif ( -e $want_dotfiles[$_] ) {
            if ( !-e $new_dir[$_] ) {
                system "mkdir $new_dir[$_]";
            }
            # system "ln -s $want_dotfiles[$_] $target_files[$_]";
            if (-d $want_dotfiles[$_]) {
                system "cp -r $want_dotfiles[$_] $target_files[$_]";
            } 
            else {
                system "cp $want_dotfiles[$_] $target_files[$_]";
            }
            if ( $? == 0 ) {
                say "link $want_dotfiles[$_] to $target_files[$_] \e[32m[success]\e[0m";
            }
        }
        else {
            carp "$want_dotfiles[$_] \e[31m[does not exists!]\e[0m";
        }
    }
    $self->remove_git();
    chomp( my $update_time = `date +%F` );
    $self->edit_section( "last link time", $update_time, $ENV{DOTCONFIG} );
}

sub deploy {
    my $self = shift;

    my @deploy_dotfiles = $self->ls_dotfiles();
    my @app_names       = $self->ls_app();
    my @ori_dotfiles =
      pairwise { catfile( $g_dir, $a, basename($b) ) }
    @app_names, @deploy_dotfiles;

    foreach ( 0 .. @ori_dotfiles - 1 ) {
        if ( -e $deploy_dotfiles[$_] ) {
            say "$deploy_dotfiles[$_] \e[32m[already exists]\e[0m";
        }
        elsif ( !-e $ori_dotfiles[$_] ) {
            say "$ori_dotfiles[$_] \e[31m[does not under control]\e[0m";
        }
        else {
            my $need_dir = dirname($deploy_dotfiles[$_]);
            system "mkdir -p ";
            if ( -f $ori_dotfiles[$_] ) {
                system "cp $ori_dotfiles[$_] $deploy_dotfiles[$_]";
            }
            else {
                system "cp -r $ori_dotfiles[$_] $deploy_dotfiles[$_]";
            }
            if ( $? == 0 ) {
                say "copy $ori_dotfiles[$_] to $deploy_dotfiles[$_] \e[32m[success]\e[0m";
            }
        }
    }
}

sub push {
    my $self        = shift;
    my $remote_name = "origin";

    # Check is git installed
    my $git_installed = system("git --version >/dev/null 2>&1");

    # work with Expect
    if ( $git_installed == 0 ) {
        say "Git is installed";
        my $username = $self->{"user"};
        my $password = $self->{"password"};

        my $expect = Expect->new();
        chdir dirname( $ENV{DOTCONFIG} );

        system "git log >/dev/null 2>&1";

        # If it's the first push
        unless ( $? == 0 ) {
            say "[Init] the directory now...";
            system "git init" or say "Finish [Init]...";
            system "git remote add $remote_name $self->{repository}"
              or say "Add remote $remote_name $self->{repository}...";
            system "git add . ; git commit -m 'Init commit'"
              or say "Finish [add] and [commit]...";

           # system "git push -u $remote_name master" or say "Finish [push]...";
            $expect->spawn( 'git', ( 'push', '-u', "$remote_name", "master" ) );
        }

        # If it's the later push
        else {
            system "git add . ; git commit -m 'Later commit'"
              or say "Finish [add] and [commit]...";
            $expect->spawn( 'git', ( 'push', "$remote_name", "master" ) )
              or carp "Something Wrong: $!";
        }
        $expect->expect( 10, [qr/Username/] );
        $expect->send("$username\n");
        $expect->expect( 10, [qr/Password/] );
        $expect->send("$password\n");
        $expect->expect( 10, [qr/To http/] );
        $expect->send("Finish pushing!");
        chomp( my $update_time = `date +%F` );
        $dotfiles->edit_section( "last push time",
            $update_time, $ENV{DOTCONFIG} );
    }
    else {
        print "Git is not installed\n";
    }

}

# update the time, link all file, update the time
#
sub update {
    my $self = shift;

    $self->edit_section("config name", basename($ENV{DOTCONFIG}), $g_file_path);
    $self->clear();
    $self->link_all();
    $self->remove();
    $self->push();
}

sub remove {
    my $self = shift;
    my @apps = map { "dot_" . $_ } $self->ls_app();
    my @all = grep { -d } glob "$g_dir/*";
    
    foreach my $app (@all) {
        if (!grep { my $app_basename = basename($app); $_ =~ /$app_basename/; } @apps) {
            say "$app \e[31m[does not in you config file]\e[0m";
            print "Do you want to \e[31m[remove $app]\e[0m [y/n]";
            my $choice = <STDIN>;
            if ( $choice =~ m/[yY]/ or $choice eq "\n" ) {
                system "rm -rf $app";
            }
            else {
                say "\e[31mfail\e[0m to remove $app";
            }
        } 
        else {
            last;
            say "\e[32m[Nothing to remove]\e[0m";
        }
    } 
}

sub remove_git {
    chdir dirname($ENV{DOTCONFIG});
    my @dirs = glob './*';

    local *STDERR;
    open(STDERR, '>', '/dev/null') or die "Cannot open /dev/null: $!";
    find(\&find_handler, @dirs);


    sub find_handler {
        my $target = $File::Find::name;
        my $final_target = catfile(dirname($ENV{DOTCONFIG}), $target);
        system "rm -rf $final_target" if /.git$/;
        say "rm $final_target \e[32m[success]\e[0m" if /.git$/;
    }
}

sub clear {
    my $dir = dirname($ENV{DOTCONFIG});
    my @targets = glob "$dir/*";

    foreach my $target (@targets) {
        if ( $target =~ /dot_/  ) {
            system "rm -rf $target";
            say "rm $target \e[32m[success]\e[0m";
        }
    }    
}

# # the file is already pass
sub edit_config {
    if ( -e "/usr/bin/nvim" ) {
        system "nvim $g_file_path";
    }
    elsif ( -e "/usr/bin/vim" ) {
        system "vim $g_file_path";
    }
    else {
        system "vi $g_file_path";
    }
}

# #
sub edit_section {
    my $self      = shift;
    my $section   = shift;
    my $content   = shift;
    my $file_path = shift;

    $self->{$section} = $content;
    unbless $self;
    my $json = JSON->new;
    open my $fh, '>', $file_path;
    print {$fh} $json->pretty->encode($self);
    bless $self => $g_class;
}

sub edit_env {
    my $var_name    = shift;
    my $var_value   = shift;
    my $description = shift // "#";
    my ($env_path, @result);

    if ( $ENV{SHELL} =~ m/zsh/ ) {
        $env_path = catfile( $ENV{HOME}, '.zshenv' );
    }
    else {
        $env_path = catfile( $ENV{HOME}, '.bashrc' );
    }

    my @text = read_file($env_path);
    unless ($ENV{$var_name}) {
        my @add_content = ("\n# $description\n", "export $var_name=\"$var_value\"");
        CORE::push @text, $add_content[$_] foreach 0..@add_content-1;
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
# Check the dependences
sub create_template {
    my ( $dir, $file_name, $file_path );

    # Default path
    my $count = 2;
    print "Default ? [y|n] ";
    my $choice = <STDIN> ;
    if ( $choice =~ m/[yY]/ or $choice eq "\n" ) {
        $count     = 0;
        $dir       = catdir( $ENV{HOME}, '.config/dotfile' );
        $file_name = 'config.json';
        $file_path = catfile( $dir, $file_name );
        unless ( -e $dir ) {
            mkdir $dir;
            say "\n\e[32mCreate the directory:\e[0m [$dir]";
        }
        else {
            say "dotfiles are stored in [$dir]";
        }
    }

    # Not the default path
    while ( $count > 0 ) {
        if ( $count == 2 ) {
            print "Enter the directory of configure file\n-> ";
            chomp( $dir = <STDIN> );
        }
        else {
            print "Enter the filename of configure file (without '.json')\n-> ";
            chomp( $file_name = <STDIN> );
            $file_name .= ".json";
        }
        $count -= 1;
    }
    unless ($file_path) {
        $file_path = catfile( $dir, $file_name );
    }

    # Define env variable
    if ( !defined $ENV{DOTCONFIG} ) {
        edit_env( 'DOTCONFIG', $file_path, "DotConfig" );
        say "\e[32Set the envionment variable:\e[0 [DOTCONFIG] ";
    }

    # Write template to file
    unless ( -e $file_path ) {
        open my $file_ref, '>', $file_path;
        croak "Can not open $file_path" if $?;

        my $previous_default = select($file_ref);
        $|++;

        print {$file_ref} $template_content;

        # when using import, this line of code will be warned
        my $dotfiles = My::Dotfile->new($file_path);

        # $dotfiles->update("time");
        select($previous_default);
    }
    else {
        say "The file \e[32malready exists\e[0m: $file_path";
    }
}

1;
