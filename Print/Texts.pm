package DublinCore::Record::Print::Texts;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Unicode::UTF8 qw(decode_utf8);

Readonly::Array our @EXPORT => qw(texts);
Readonly::Hash our %CES => (
	'contributor' => decode_utf8('Přispěvatel'),
	'coverage' => decode_utf8('Pokrytí'),
	'creator' => decode_utf8('Tvůrce'),
	'date' => 'Datum',
	'description' => 'Popis',
	'format' => decode_utf8('Formát'),
	'identifier' => decode_utf8('Identifikátor'),
	'language' => 'Jazyk',
	'publisher' => 'Vydavatel',
	'relation' => 'Vztah',
	'rights' => decode_utf8('Práva'),
	'source' => 'Zdroj',
	'subject' => decode_utf8('Předmět'),
	'title' => decode_utf8('Název'),
	'type' => 'Typ',
);
Readonly::Hash our %ENG => (
	'contributor' => 'Contributor',
	'coverage' => 'Coverage',
	'creator' => 'Creator',
	'date' => 'Date',
	'description' => 'Description',
	'format' => 'Format',
	'identifier' => 'Identifier',
	'language' => 'Language',
	'publisher' => 'Publisher',
	'relation' => 'Relation',
	'rights' => 'Rights',
	'source' => 'Source',
	'subject' => 'Subject',
	'title' => 'Title',
	'type' => 'Type',
);

our $VERSION = 0.01;

sub texts {
	my $lang = shift;

	my $ret_hr;
	if ($lang eq 'ces') {
		$ret_hr = \%CES;
	} elsif ($lang eq 'eng') {
		$ret_hr = \%ENG;
	} else {
		err "Language '$lang' doesn't supported.";
	}

	return $ret_hr;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

DublinCore::Record::Print::Texts - Translation texts for Dublin Core.

=head1 SYNOPSIS

 use DublinCore::Record::Print::Texts qw(texts);

 my $texts_hr = texts($lang);

=head1 SUBROUTINES

=head2 C<texts>

 my $texts_hr = texts($lang);

Get translated tests.

Returns reference to hash.

=head1 ERRORS

 texts():
         Language '%s' doesn't supported.

=head1 EXAMPLE1

=for comment filename=print_texts_eng.pl

 use strict;
 use warnings;

 use Data::Printer;
 use DublinCore::Record::Print::Texts qw(texts);

 # Get texts.
 my $texts_hr = texts('eng');

 # Print out.
 p $texts_hr;

 # Output like:
 # {
 #     contributor   "Contributor",
 #     coverage      "Coverage",
 #     creator       "Creator",
 #     date          "Date",
 #     description   "Description",
 #     format        "Format",
 #     identifier    "Identifier",
 #     language      "Language",
 #     publisher     "Publisher",
 #     relation      "Relation",
 #     rights        "Rights",
 #     source        "Source",
 #     subject       "Subject",
 #     title         "Title",
 #     type          "Type"
 # } (tied to Readonly::Hash)

=head1 EXAMPLE2

=for comment filename=print_texts_ces.pl

 use strict;
 use warnings;

 use Data::Printer return_value => 'dump';
 use DublinCore::Record::Print::Texts qw(texts);
 use Unicode::UTF8 qw(encode_utf8);

 # Get texts.
 my $texts_hr = texts('ces');

 # Print out.
 my $dump = p $texts_hr;
 print encode_utf8($dump)."\n";

 # Output like:
 # {
 #     contributor   "Přispěvatel",
 #     coverage      "Pokrytí",
 #     creator       "Tvůrce",
 #     date          "Datum",
 #     description   "Popis",
 #     format        "Formát",
 #     identifier    "Identifikátor",
 #     language      "Jazyk",
 #     publisher     "Vydavatel",
 #     relation      "Vztah",
 #     rights        "Práva",
 #     source        "Zdroj",
 #     subject       "Předmět",
 #     title         "Název",
 #     type          "Typ"
 # } (tied to Readonly::Hash)

=head1 DEPENDENCIES

L<Error::Pure>,
L<Exporter>,
L<Readonly>,
L<Unicode::UTF8>.

=head1 SEE ALSO

=over

=item L<DublinCore::Print>

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
