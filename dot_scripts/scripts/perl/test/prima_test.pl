use Prima qw(Application Buttons);
 
Prima::MainWindow->new(
        text     => 'Hello world!',
        size     => [ 1000, 1000],
)-> insert( Button =>
        centered => 1,
        text     => 'Hello world!',
        onClick  => sub { $::application-> close },
);
 
run Prima;
