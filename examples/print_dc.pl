#!/usr/bin/env perl

use strict;
use warnings;

use DublinCore::Print;
use DublinCore::Record;

# DC record.
my $rec = DublinCore::Record->new;
$rec->add(DublinCore::Element->new({
        'content' => 'Ed Summers',
        'name' => 'creator',
}));

# Object.
my $obj = DublinCore::Print->new;

# Print out.
print $obj->print($rec)."\n";

# Output like:
# TODO