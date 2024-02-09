#!/usr/bin/env perl

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