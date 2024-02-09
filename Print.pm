package DublinCore::Record::Print;

use strict;
use warnings;

use Class::Utils qw(set_params);
use DublinCore::Record::Print::Texts qw(texts);
use Error::Pure qw(err);
use List::Util 1.33 qw(none);
use Readonly;
use Scalar::Util qw(blessed);
use Unicode::UTF8 qw(encode_utf8);

Readonly::Array our @SUPPORTED_OBJ => qw(DublinCore::Record);

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	$self->{'flag_keys'} = 1;

	$self->{'lang'} = 'eng';

	$self->{'output_sep'} = "\n";

	# Process parameters.
	set_params($self, @params);

	if (! defined $self->{'lang'}) {
		err "Parameter 'lang' is required.";
	}
	$self->{'_texts'} = texts($self->{'lang'});

	return $self;
}

sub print {
	my ($self, $dc) = @_;

my @ret;

	if (! defined $dc) {
		err 'No Dublin Core object to print.';
	}
	if (! blessed($dc) || none { $dc->isa($_) } @SUPPORTED_OBJ) {
		err 'Bad Dublin Core object to print.'
	}

	# Construct output.
	if ($dc->isa('DublinCore::Record')) {
		@ret = $self->_dublin_core_record($dc);
	} else {
		err "Object '".(ref $dc)."' doesn't supported.";
	}

	return wantarray ? @ret : join $self->{'output_sep'}, @ret;
}

sub _dublin_core_record {
	my ($self, $dc) = @_;

	my @ret;
#	push @ret, $self->_text('title', $dc->title);
	foreach my $elem ($dc->elements) {
#use Data::Printer;
#p $elem;
		my $qualifier = $elem->qualifier;
		my $scheme = $elem->scheme;
		my $language = $elem->language;
		if ($self->{'flag_keys'}) {
			printf "%s: %s\n",
				$elem->name.
				($qualifier ? ".$qualifier" : '').
				($scheme ? "($scheme)" : '').
				($language ? "($language)" : ''),
				encode_utf8($elem->content);
		} else {
			# TODO Implement.
		}
	}

	return @ret;
}

sub _text {
	my ($self, $key, $value) = @_;

	return $self->{'_texts'}->{$key}.': '.$value;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

DublinCore::Record::Print - Class for Dublin Core record print.

=head1 SYNOPSIS

 use DublinCore::Record::Print;

 my $obj = DublinCore::Record::Print->new(%params);
 my $scalar = $obj->print($dc);
 my @lines = $obj->print($dc);

=head1 METHODS

=head2 C<new>

 my $obj = DublinCore::Record::Print->new(%params);

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
         From DublinCore::Record::Print::Texts::texts():
                 Language '%s' doesn't supported.
         Parameter 'lang' is required.

 print():
         Bad Dublin Core object to print.
         No Dublin Core object to print.

=head1 EXAMPLE

=for comment filename=print_dc.pl

 use strict;
 use warnings;

 use DublinCore::Record;
 use DublinCore::Record::Print;

 # DC record.
 my $rec = DublinCore::Record->new;
 $rec->add(DublinCore::Element->new({
         'content' => 'Ed Summers',
         'name' => 'creator',
 }));

 # Object.
 my $obj = DublinCore::Record::Print->new;

 # Print out.
 print $obj->print($rec)."\n";

 # Output like:
 # TODO

=head1 DEPENDENCIES

L<Class::Utils>,
L<Error::Pure>,
L<List::Util>,
L<Readonly>,
L<Scalar::Util>,
L<Unicode::UTF8>.

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

L<https://github.com/michal-josef-spacek/DublinCore-Record-Print>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2023-2024 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
