use Env::Assert qw( assert report_errors );
use feature qw(say);
 
my %want = (
    options => {
        exact => 1,
    },
    variables => {
        USER => { regexp => 'jie', required => 1 },
    },
);
my %parameters;
$parameters{'break_at_first_error'} = 1;
my $r = assert( \%ENV, \%want, \%parameters );
if( ! $r->{'success'} ) {
    say report_errors( $r->{'errors'} );
}g
