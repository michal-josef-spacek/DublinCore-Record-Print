#!/usr/bin/env perl

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