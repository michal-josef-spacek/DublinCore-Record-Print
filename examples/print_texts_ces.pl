#!/usr/bin/env perl

use strict;
use warnings;

use Data::Printer return_value => 'dump';
use DublinCore::Print::Texts qw(texts);
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