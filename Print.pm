package DublinCore::Print;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Error::Pure qw(err);
use List::Util qw(none);
use Readonly;
use Scalar::Util qw(blessed);

Readonly::Array our @SUPPORTED_OBJ => qw(DublinCore::Record);

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	$self->{'output_sep'} = "\n";

	# Process parameters.
	set_params($self, @params);

	return $self;
}

sub print {
	my ($self, $dc) = @_;

	my @ret;

	if (! defined $dc) {
		err 'No Dublin Core object to print.';
	}
	if (! blessed($dc) || none { $dc eq $_ } @SUPPORTED_OBJ) {
		err 'Bad Dublin Core object to print.'
	}

	# TODO

	return wantarray ? @ret : join $self->{'output_sep'}, @ret;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

DublinCore::Print - Class for random day generation.

=head1 SYNOPSIS

 use DublinCore::Print;

 my $obj = DublinCore::Print->new(%params);
 my $scalar = $obj->print($dc);
 my @lines = $obj->print($dc);

=head1 METHODS

=head2 C<new>

 my $obj = DublinCore::Print->new(%params);

Constructor.

=over 8

=item * C<output_sep>

Output separator.

Default value is "\n".

=back

Returns instance of object.

=head2 C<print>

 my $scalar = $obj->print($dc);
 my @lines = $obj->print($dc);

TODO

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.

 print():
         Bad Dublin Core object to print.
         No Dublin Core object to print.

=head1 EXAMPLE

=for comment filename=print_dc.pl

 use strict;
 use warnings;

 use DublinCore::Print;

 # Object.
 my $obj = DublinCore::Print->new;

 # Print out.
 print $obj->print."\n";

 # Output like:
 # TODO

=head1 DEPENDENCIES

L<Class::Utils>,
L<Error::Pure>,
L<List::Util>,
L<Readonly>,
L<Scalar::Util>.

=head1 SEE ALSO

=over

=item L<DublinCore::Record>

TODO

=item L<DublinCore::Element>

TODO

=item L<Data::DublinCore>

TODO

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/DublinCore-Print>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2023 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
