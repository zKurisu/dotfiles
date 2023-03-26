#! /usr/bin/perl
#  Test.pm
#
#  
#
#  Copyright (Perl) Jie
#  2023-01-28
# 
package My::Test;
# use overload;
use Carp;
use Exporter;

our @EXPORT = qw(new Hello class_only_method);

sub new {
    my $class = shift;
    my $self = {};
    bless($self, $class);
    return $self;
}


sub Hello {
    print "Hello!";
}

sub class_only_method {
    my $class = shift;
    my $ref_return = ref $class;
    print "ref_return: $ref_return";
    croak "class method invoked on object" if ref $class;

    #print "Class only\n";
}

1;
