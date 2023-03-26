package test::Person;
sub new {
    my $class = shift;
    my $self = {};
    return bless $self => $class;
}

sub name {
    my $self = shift;
    $self->{NAME} = shift if @_;
    return $self->{NAME};
}

sub age {
    my $self = shift;
    $self->{AGE} = shift if @_;
    return $self->{AGE};
}


1;
